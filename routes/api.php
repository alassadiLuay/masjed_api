<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('login', 'UserController@login');

Route::get('get_semesters', 'UserController@get_semesters');
Route::get('get_semester_course', 'UserController@get_semester_course');
Route::get('get_course_students', 'StudentsController@get_course_students');
Route::get('get_course_attendees', 'StudentsController@get_course_attendees');
Route::get('set_course_attendees', 'StudentsController@set_course_attendees');
Route::post('set_student_listened_subjects', 'StudentPointsController@set_student_listened_subjects');
Route::post('set_student_points', 'StudentPointsController@set_student_points');
Route::post('set_students_points', 'StudentPointsController@set_students_points');
Route::get('get_subjects', 'StudentPointsController@get_subjects');
Route::get('get_last_subjects', 'StudentPointsController@get_last_subjects');
Route::get('get_points', 'StudentPointsController@get_points');


Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
