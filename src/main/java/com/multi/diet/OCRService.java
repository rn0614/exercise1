package com.multi.diet;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class OCRService {
	public NutriFactVO clovaOCRService(String filePathName) {
		NutriFactVO nfvo = new NutriFactVO();
		
		String result = "";
		String[] resultList = new String[4];
		
		String apiURL = "https://5e78a5e6a725444e89a18094bfdbe08a.apigw.ntruss.com/custom/v1/8911/4f2242ae2d8951cfba560fbc560883694eb0b523b0d24f1e779431c440d8c8a2/general";
		String secretKey = "c1R4VGlQaHV5b0ZRb1didHhkRXJvSFl1TlZ2ZE1pdkQ=";
		String imageFile = filePathName;

		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setReadTimeout(30000);
			con.setRequestMethod("POST");
			String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
			con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
			con.setRequestProperty("X-OCR-SECRET", secretKey);

			JSONObject json = new JSONObject();
			json.put("version", "V2");
			json.put("requestId", UUID.randomUUID().toString());
			json.put("timestamp", System.currentTimeMillis());
			JSONObject image = new JSONObject();
			image.put("format", "jpg");
			image.put("name", "demo");
			JSONArray images = new JSONArray();
			images.put(image);
			json.put("images", images);
			String postParams = json.toString();

			con.connect();
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			long start = System.currentTimeMillis();
			File file = new File(imageFile);
			writeMultiPart(wr, postParams, file, boundary);
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();  

			System.out.println(response);  // JSON 형식의 문자열 출력
			System.out.println(response.toString());
			
			// result = jsonToString(response.toString());  // 결과 반환
			System.out.println(jsonToString(response.toString()));
			nfvo = customizeOCRText(jsonToString(response.toString()));  // 결과 반환
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return nfvo;
	}
	
	private static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary) throws
		IOException {
		StringBuilder sb = new StringBuilder();
		sb.append("--").append(boundary).append("\r\n");
		sb.append("Content-Disposition:form-data; name=\"message\"\r\n\r\n");
		sb.append(jsonMessage);
		sb.append("\r\n");
	
		out.write(sb.toString().getBytes("UTF-8"));
		out.flush();
	
		if (file != null && file.isFile()) {
			out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
			StringBuilder fileString = new StringBuilder();
			fileString
				.append("Content-Disposition:form-data; name=\"file\"; filename=");
			fileString.append("\"" + file.getName() + "\"\r\n");
			fileString.append("Content-Type: application/octet-stream\r\n\r\n");
			out.write(fileString.toString().getBytes("UTF-8"));
			out.flush();
	
			try (FileInputStream fis = new FileInputStream(file)) {
				byte[] buffer = new byte[8192];
				int count;
				while ((count = fis.read(buffer)) != -1) {
					out.write(buffer, 0, count);
				}
				out.write("\r\n".getBytes());
			}
	
			out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
		}
		out.flush();
	}
	
	// 이미지에서 텍스트 추출
	// JSON 형식의의 문자열에서 텍스트만 추출해서 문자열 반환: inferText 값 추출
	public String jsonToString(String jsonStr) {
		String resultText = "";
		
		// 추출할 오브젝트: images, fields, inferText의 값 
		JSONObject jsonObj = new JSONObject(jsonStr);
		
		// jsonObj에서 image 추출: 리스트
		JSONArray imgArray = (JSONArray)jsonObj.get("images");
		// 리스트의 요소가 1개 밖에 없으므로 index를 0으로 지정
		JSONObject imgObj = (JSONObject)imgArray.get(0);
		
		// fields 추출: 리스트
		JSONArray fieldsArray = (JSONArray)imgObj.get("fields");
		
		if (fieldsArray != null) {
			for (int i=0; i<fieldsArray.length(); i++) {  // size()가 아니고 length() (org.json.JSONArray 사용)
				JSONObject tempObj = (JSONObject)fieldsArray.get(i);
				String str = (String)tempObj.get("inferText");
				resultText += str + " ";
			}
		} else {
			System.out.println("없음");
		}
		return resultText;
	}
	
	public NutriFactVO customizeOCRText (String ocrText) {
		// 영양정보 총 내용량 46 g /206 kcal 1일 영양성분 1일 영양성분 1봉지당 기준치에 대한 1봉지당 기준치에 대한 비율
		// 영양정보 총 내용량 90g 465 kcal 나트륨 610 mg 31% 탄수화물 54 g 17% 당류 5 g 5% 지방 25g 46% 
		// 영양정보 총 내용량 127 g 530 kcal 나트륨 1,880 mg 94% 탄수화물 83g 26% 당류 7 g 7% 지방 17g
		// 영양정보 총 내용량 1,320g 1회섭취참고량(30g)당 116kcal 1일 영양성분 30g당 기준치에 대한 비율 100g당 나트륨 135 mg 7% 450 mg 23 % 탄수화물 26.7g 8% 89g 27 % 당류 9.5g 10% 31.7g 32 % 지방 0.4g 1% 1.2g 2% 트랜스지방 0g 0g 포화지방 0g 0% 0
		double ocrTotAmount = 0;
        String ocrAmtUnit = "";
        double ocrUnitAmt = 0;
        double ocrUnitCal = 0;

        NutriFactVO nfvo = new NutriFactVO();
        
        String[] ocrResult = ocrText.split(" ");

        // 문자열 순회 => StringObj.charAt(j) 사용
        // substring(0, 4) => 0, 1, 2, 3 나온다
        
        for (int i = 0; i < ocrResult.length; i++) {
            if (ocrResult[i].contains("내용량")) {

                ocrResult[i + 1] = ocrResult[i + 1].trim();
                ocrResult[i + 2] = ocrResult[i + 2].trim();

                ocrResult[i + 1] = delete(ocrResult[i + 1], ",");
                ocrResult[i + 1] = delete(ocrResult[i + 1], "/");

                if (isNumeric(ocrResult[i + 1])) { // 단위가 포함되어 있다면
                    ocrTotAmount = Double.parseDouble(ocrResult[i + 1]);
                    ocrAmtUnit = ocrResult[i + 2];

                } else { // 단위가 포함되어 있지 않다면
                    for (int j=0; j<ocrResult[i + 1].length(); j++){
                        if (Character.isDigit(ocrResult[i + 1].charAt(j))){
                        } else {
                            ocrTotAmount = Double.parseDouble(ocrResult[i + 1].substring(0, j));
                            ocrAmtUnit = ocrResult[i + 1].substring(j);
                            break;
                        }
                    }
                }
            }
        

            if (ocrResult[i].contains("kcal")) { // "kcal"이 포함되어있다면
                ocrResult[i - 1] = ocrResult[i - 1].trim();  // "kcal"와 데이터가 떨어져있다면 실제 데이터 위치
                ocrResult[i] = ocrResult[i].trim();

                ocrResult[i - 1] = delete(ocrResult[i - 1], ",");
                ocrResult[i - 1] = delete(ocrResult[i - 1], "/");
                ocrResult[i] = delete(ocrResult[i], ",");
                ocrResult[i] = delete(ocrResult[i], "/");

                if (ocrResult[i].length() == 4) { // 단위만 저장되어있다면
                    ocrUnitCal = Double.parseDouble(ocrResult[i - 1]);
                    break;
                } else {  // 단위와 데이터가 함께 있다면
                    for (int j=0; j<ocrResult[i].length(); j++){
                        if (Character.isDigit(ocrResult[i].charAt(j))){
                        } else {
                            ocrUnitCal = Double.parseDouble(ocrResult[i].substring(0, j));
                            break;
                        }
                    }
                }
            }
            
            if (ocrResult[i].contains("1회") || ocrResult[i].contains("1 회") ||
                    ocrResult[i].contains("1일") || ocrResult[i].contains("1 일")) {
            	// 1회 제공량 찾는 알고리즘
            	
            }
            
            
            
        } // for 문 종료
        
        ocrUnitAmt = ocrTotAmount;
        
        nfvo.setTotalAmount(ocrTotAmount);
        nfvo.setAmountUnit(ocrAmtUnit);
        nfvo.setUnitAmount(ocrUnitAmt);
        nfvo.setUnitcalories(ocrUnitCal);
        
        return nfvo;
	}
            
    public boolean isNumeric (String input){
        try {
            Double.parseDouble(input);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    public String delete(String input, String c){
        if (input.contains(c)) {
            input = input.substring(0, input.indexOf(c))
                    + input.substring(input.indexOf(c) + 1);
        }
        return input;
    }

     
}
