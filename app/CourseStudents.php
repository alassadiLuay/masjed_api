<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CourseStudents extends Model
{
    protected $table = 'course_students';
    protected $fillable = ['id','course_id','student_id'];
    public $timestamps = true;

    static function get_students($course_id){
        return CourseStudents::select('course_students.*', 'students.student_fname','students.student_lname')
            ->join('students', 'students.id', '=', 'course_students.student_id')
            ->where('course_students.course_id',$course_id)
            ->get();

    }

}


