package com.multi.exercise;

import java.util.ArrayList;

public interface IExerciseService {
	ArrayList<ExerciseVO> exerciseList(String loginId);
	void insertExercise(ExerciseVO DayExercise);
	void updateExercise(ExerciseVO DayExercise);
	void deleteExercise(String dayNo);
	ExerciseVO exerciseDetailView(String dayNo);
	ArrayList<ExerciseVO> byExerciseList(String loginId, int condYear, int condMonth, int condDate);
}
