<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StudentPoints extends Model
{
    //
    protected $table = 'student_points';
    protected $fillable = ['student_id','point_id'];
    public $timestamps = true;
}
