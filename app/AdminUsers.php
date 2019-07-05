<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AdminUsers extends Model
{

    protected $table = 'admin_users';
    protected $fillable = ['id','name','email', 'password'];
    public $timestamps = true;



}
