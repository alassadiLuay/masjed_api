<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Semesters extends Model
{

    protected $table = 'semesters';
    protected $fillable = ['id','semester_name'];
    public $timestamps = true;

    function courses(){
        return $this->hasMany(Courses::class,'semester_id');
    }



}
