package com.multi.exercise;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class ExerciseService implements IExerciseService {
	@Autowired
	@Qualifier("IExerciseDAO")
	IExerciseDAO dao;
	
	@Override
	public ArrayList<ExerciseVO> exerciseList(String loginId) {
		return dao.exerciseList(loginId);
	}

	@Override
	public void insertExercise(ExerciseVO DayExercise) {
		dao.insertExercise(DayExercise);

	}

	@Override
	public void updateExercise(ExerciseVO DayExercise) {
		dao.updateExercise(DayExercise);

	}

	@Override
	public void deleteExercise(String dayNo) {
		dao.deleteExercise(dayNo);

	}

	@Override
	public ExerciseVO exerciseDetailView(String dayNo) {
		return dao.exerciseDetailView(dayNo);
	}
	
	@Override 
    public ArrayList<ExerciseVO> byExerciseList(String loginId, int condYear, int condMonth, int condDate) { 
	    return dao.byExerciseList(loginId, condYear, condMonth, condDate); 
    }
}