<?php

namespace App\Http\Controllers;

use App\CourseStudents;
use App\StudentAttendances;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class StudentsController extends BaseController
{

    function get_course_students(Request $request){
        $course_id = $request->course_id;
        return $this->responseCustom(true,CourseStudents::get_students($course_id),"");
    }

    function get_course_attendees(Request $request){
        $course_id = $request->course_id;
        $day = $request->day;
        return $this->responseCustom(true,StudentAttendances::get_attendess($course_id,$day),"");
    }

    function set_course_attendees(Request $request){

        $students = explode(',',$request->students);
        $points = explode(',',$request->points);
        $day = $request->day;
        $course_id = $request->course_id;

        for ($i = 0; $i < count($students); $i++) {
            $attendess = StudentAttendances::where('student_id',$students[$i])
                ->where('day',$day)
                ->where('course_id',$course_id)->first();
            if ($attendess == null){$attendess = new StudentAttendances();}
            $attendess->student_id = $students[$i];
            $attendess->point_id = $points[$i];
            $attendess->course_id = $course_id;
            $attendess->day = $day;
            $attendess->save();
        }

        return $this->responseCustom(true,null,"");
    }

    function set_course_attendance(Request $request){

        $params = json_decode(trim(file_get_contents('php://input'),TRUE));     
        $array = $params->std;
        $point_id = $params->std;

        for ($i = 0; $i < count($students); $i++) {
            $attendess = StudentAttendances::where('student_id',$students[$i])
                ->where('day',$day)
                ->where('course_id',$course_id)->first();
            if ($attendess == null){$attendess = new StudentAttendances();}
            $attendess->student_id = $students[$i];
            $attendess->point_id = $points[$i];
            $attendess->course_id = $course_id;
            $attendess->day = $day;
            $attendess->save();
        }

        return $this->responseCustom(true,null,"");
    }

    function registerAttendenceAll(){      
        $params = json_decode(trim(file_get_contents('php://input'),TRUE));     
        $array = $params->std;
        var_dump($params);
        /*
        for ($i=0; $i < sizeof($array); $i++) {
            $id       = $array[$i]->id;     
            $is_early = $array[$i]->is_early;
            if($is_early=="none"){
                    $this->teacher_model->remove_register($id);
                }
            else{
                $can_continue = $this->teacher_model->check_register($id); 
                if($can_continue){              
                    $affected = $this->teacher_model->add_register($id,$is_early);
                }   
            }   
        }
        $this->response("{result:added}" , 200);*/
        return $this->responseCustom(true,null,"");
    }
}
