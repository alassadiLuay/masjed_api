<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Teachers extends Model
{

    protected $table = 'teachers';
    protected $fillable = ['id'];
    public $timestamps = true;



}
