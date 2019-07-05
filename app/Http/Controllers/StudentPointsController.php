<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\StudentPoints;
use App\StudentListenedPage;
use App\Subjects;
use App\SubjectsPage;
use App\StudentAttendances;

class StudentPointsController extends BaseController
{
    
    function set_students_points(Request $request){
        $out = new \Symfony\Component\Console\Output\ConsoleOutput();
        $student_ids = $request->std;
        $originalDate = Date("d-m-Y");
        $newDate = date("d-m-Y", strtotime($originalDate));
        $true = false;
        for ($i=0; $i < sizeof($student_ids); $i++) { 
            # code...
            $attends = StudentPoints::where('student_id',$student_ids[$i]['id'])
            ->whereRaw("DATE_FORMAT(student_points.created_at, '%d-%m-%Y') = '".$newDate."' and point_id = 6 or point_id = 7")->first();
            if('point_id' !== '-1') {
                if ($attends == null){
                    $studnet_point = new StudentPoints();
                    $studnet_point->student_id = $student_ids[$i]['id'];
                    $studnet_point->point_id = $student_ids[$i]['point_id'];
                    $res = $studnet_point->save();
                }
            }
            else{
                $attends->delete();
            }
            $true = true;
        }
        if($true)
            return $this->responseCustom(true,null,"تم إضافة النقاط بنجاح");
        else
            return $this->responseError("عذرا حدث خطأ ما");
    }

    function set_student_points(Request $request){
        $student_id = $request->student_id;
        $point_id = $request->point_id;

        $studnet_point = new StudentPoints();
        $studnet_point->student_id = $student_id;
        $studnet_point->point_id = $point_id;
        $res = $studnet_point->save();
        if($res)
            return $this->responseCustom(true,null,"تم إضافة النقاط بنجاح");
        else
            return $this->responseError("عذرا حدث خطأ ما");
    }

    function set_student_listened_subjects(Request $request){
        $student_id = $request->student_id;
        $student_cid = $request->student_cid;
        $subject_id = $request->subject_id;
        $subject_type = $request->subject_type;
        $prev_date = StudentListenedPage::check_student_listened_subjects($student_id,$student_cid,$subject_id,$subject_type);
        if(!isset($prev_date[0])){
            $studnet_listened_sub = new StudentListenedPage();
            $studnet_listened_sub->student_id = $student_id;
            $studnet_listened_sub->student_course_id = $student_cid;
            $studnet_listened_sub->subject_id = $subject_id;
            $studnet_listened_sub->subject_type = $subject_type;

            $res = $studnet_listened_sub->save();
        }

        if(isset($res) && $res)
            return $this->responseCustom(true,null,"تم إضافة معلومات التسميع بنجا");
        else if(isset($prev_date[0]))
            return $this->responseError("تم التسميع من قبل");
        else
            return $this->responseError("عذرا حدث خطأ ما");
    }

    function get_subjects(Request $request){
        //Function
        /**
        ** Select * from $subjects left join listened_subjects on subject_id = $subjects.id and subject_type=$subjects where subject_id is NULL
        */

        if($request->subject_type == "surah"){
            $subjects = Subjects::get_subject_records($request->student_cid);
            if(sizeof($subjects) == 0)
                $subjects = Subjects::select('*','surah_name as subject_name','surah.id as s_id')->groupBy('s_id')->get()->toArray();
        }
        else{
            $subjects = SubjectsPage::get_subject_records($request->student_cid);
            if(sizeof($subjects) == 0)
                $subjects = SubjectsPage::select('*','page_name as subject_name','page.id as s_id')->groupBy('s_id')->get()->toArray();
        }
        return $this->responseCustom(true,$subjects,"");
    }

    function get_last_subjects(Request $request)
    {
        # code...
        $subjects = StudentListenedPage::where(["student_course_id"=>$request->student_cid])->orderBy('created_at', 'desc')->first();
        if(isset($subjects['subject_type'])){
            if($subjects['subject_type']=='surah'){
                $tempObj = Subjects::select('surah_name as subject_name')->where(["id"=>$subjects['subject_id']])->first();
                $subjects['last_subject'] = $tempObj['subject_name'];
            }
            else{
                $tempObj = SubjectsPage::select('page_name as subject_name','juza_id')->where(["id"=>$subjects['subject_id']])->first();
                $subjects['last_subject'] = $tempObj['subject_name'];
                $subjects['juza_id'] = $tempObj['juza_id'];
            }
        }
        return $this->responseCustom(true,$subjects,"");
    }

    function get_points(Request $request)
    {
        # code...
        $points = SubjectsPage::get_points();
        return $this->responseCustom(true,$points,"");
    }
}
