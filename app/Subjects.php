<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Subjects extends Model
{
    //
    protected $table = 'surah';
    
    static function get_subject_records($student_cid){
        /*return Subjects::select('*','surah_name as subject_name','surah.id as s_id')
            ->leftJoin('listened_subjects', 'listened_subjects.subject_id', '!=', 'surah.id')
            ->where('subject_type','surah')
            ->where('student_course_id',$student_cid)
            ->groupBy('s_id')
            ->get()->toArray();*/

        return DB::table('surah')->select('*','surah_name as subject_name','surah.id as s_id')->whereNotIn('id', function($q) use ($student_cid) {
			    	$q->select('subject_id')->from('listened_subjects')
			    	  ->where('subject_type','surah')
            		  ->where('student_course_id',$student_cid);
			})->get()->toArray();    
    }
}
