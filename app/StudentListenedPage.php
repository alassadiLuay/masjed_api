<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StudentListenedPage extends Model
{
    //
    protected $table = 'listened_subjects';
    protected $fillable = ['student_id','student_course_id','subject_id','subject_type'];
    public $timestamps = true;

    static function check_student_listened_subjects($student_id,$student_cid,$subject_id,$subject_type){
        return StudentListenedPage::select('created_at')
            ->where('student_id', $student_id)
            ->where('student_course_id',$student_cid)
            ->where('subject_id', $subject_id)
            ->where('subject_type',$subject_type)
            ->get()->toArray();
    }
}
