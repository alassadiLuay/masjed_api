<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Courses extends Model
{
    protected $table = 'courses';
    protected $fillable = ['id','semester_id','course_name','class'];
    public $timestamps = true;



}
