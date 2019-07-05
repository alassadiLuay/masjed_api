<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StudentAttendances extends Model
{

    protected $table = 'student_attendances';
//    protected $primaryKey = ['student_id', 'day'];
//    public $incrementing = false;
    protected $fillable = ['id','student_id','point_id','day','course_id'];
    public $timestamps = true;


    static function get_attendess($course_id,$day){
        return StudentAttendances::select('student_attendances.*','students.student_fname','students.student_lname','point_configs.point_name')
            ->join('point_configs','point_configs.id','student_attendances.point_id')
            ->join('students','students.id','student_attendances.student_id')
            ->where('course_id', $course_id)
            ->where('day',$day)
            ->get();
    }



}
