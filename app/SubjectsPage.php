<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class SubjectsPage extends Model
{
    //
    protected $table = 'page';
    
    static function get_subject_records($student_cid){
        /*return SubjectsPage::select('*','page_name as subject_name','page.id as s_id')
            ->leftJoin('listened_subjects', 'listened_subjects.subject_id', '!=', 'page.id')
            ->where('subject_type','page')
            ->where('student_course_id',$student_cid)
            ->groupBy('s_id')
            ->get()->toArray();*/

        return DB::table('page')->select('*','page_name as subject_name','page.id as s_id')->whereNotIn('id', function($q) use ($student_cid){
			    	$q->select('subject_id')->from('listened_subjects')
			    	  ->where('subject_type','page')
            		  ->where('student_course_id',$student_cid);
			})->get()->toArray();
    }

    static function get_points(){
    	return DB::table('point_configs')->select('point_name','point_value','id')->where(["point_type_id"=>"4"])->get()->toArray();
    }
}
