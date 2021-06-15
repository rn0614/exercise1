package com.multi.management;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.multi.diet.DietController;
import com.multi.diet.FoodController;
import com.multi.diet.ICalendarDAO;
import com.multi.diet.IFoodDAO;
import com.multi.exercise.ExerciseController;
import com.multi.exercise.IExerciseDAO;
import com.multi.member.IMemberDAO;
import com.multi.member.MemberController;

@SpringBootApplication
@ComponentScan(basePackageClasses = AiController.class)
@ComponentScan(basePackageClasses = MemberController.class)
@ComponentScan(basePackageClasses = ExerciseController.class)
@ComponentScan(basePackageClasses = DietController.class)
@ComponentScan(basePackageClasses = FoodController.class)

@MapperScan(basePackageClasses=IMemberDAO.class)
@MapperScan(basePackageClasses=IExerciseDAO.class)
@MapperScan(basePackageClasses=ICalendarDAO.class)
@MapperScan(basePackageClasses=IFoodDAO.class)

public class ExerciseManagerApplication {

	public static void main(String[] args) {
		SpringApplication.run(ExerciseManagerApplication.class, args);
	}

}
