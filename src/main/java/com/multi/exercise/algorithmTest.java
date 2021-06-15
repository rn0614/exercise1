package com.multi.exercise;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class algorithmTest {
	public void Test() {
		String[] result;
		String[] indexString = { "개", "번", "분", "시간", "키로", "회" };
		StringBuffer sb = new StringBuffer();
		String str = "운동 이름 12 번 100 키로"; // 입력 String 문자
		String str2 = str.replaceAll("\\s+", ""); // 모든 공백 제거
		sb.append(str2);

		// 문자열에서 숫자와 글자 사이에 공백넣기
		int j = 0;
		for (int i = 0; i < (str2.length() - 1); i++) {
			if (chknum(sb.charAt(i + j)) != chknum(sb.charAt(i + j + 1))) {
				sb.insert(i + j + 1, " ");
				j++;
			}
		}
		String str3 = sb.toString();

		// 공백 기준으로 나누기 (운동이름/ 자료형1/ 구분형1/ 자료형2/ 구분형2)
		result = str3.split(" ");

		// 무식하게 때려박기..
		String exName = result[0]; // 운동이름은 exName
		String exCount = null;
		String exWeight = null;
		String exTime = null;
		String exMeter = null;
		if (result[2].equals(indexString[0])) {
			exCount = result[1];
		} else if (result[2].equals(indexString[1])) {
			exCount = result[1];
		} else if (result[2].equals(indexString[2])) {
			exTime = result[1];
		} else if (result[2].equals(indexString[3])) {
			exTime = result[1];
		} else if (result[2].equals(indexString[4])) {
			exWeight = result[1];
		} else if (result[2].equals(indexString[5])) {
			exCount = result[1];
		}

		if (result[4].equals(indexString[0])) {
			exCount = result[1];
		} else if (result[4].equals(indexString[1])) {
			exCount = result[1];
		} else if (result[4].equals(indexString[2])) {
			exTime = result[1];
		} else if (result[4].equals(indexString[3])) {
			exTime = result[1];
		} else if (result[4].equals(indexString[4])) {
			exWeight = result[1];
		} else if (result[4].equals(indexString[5])) {
			exCount = result[1];
		}

		String jsonStr = "{" + "'exName': " + "'" + exName + "'" + "," + "'exCount': " + "'" + exCount + "'" + ","
				+ "'exWeight': " + "'" + exWeight + "'" + "," + "'exTine': " + "'" + exTime + "'" + "," + "'exMeter': "
				+ "'" + exMeter + "'" + "}";
		System.out.println(jsonStr);

		JSONParser parser = new JSONParser();
		// 오브젝트에 담음
		Object obj = null;
		try {
			obj = parser.parse(jsonStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// Json 으로 변경
		JSONObject jsonObj = (JSONObject) obj;
	}

	// 숫자인지 문자인지 확인 구문
	public static boolean chknum(char check) {
		if (check < 48 || check > 58)
			return false;
		return true;
	}
}
