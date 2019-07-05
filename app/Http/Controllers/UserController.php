<?php

namespace App\Http\Controllers;

use App\AdminUsers;
use App\Courses;
use App\Semesters;
use App\Teachers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserController extends BaseController
{

    function login(Request $request){

//        $auth = $this->isAuthorized($request);
//
//        if ($auth['status'] == false) {
//            return $this->responseError((string)$auth['message']);
//        }

        $username = $request->post('username');
        $password = $request->post('password');

        if (is_null($username) || is_null($password)) {
            return array('status' => false, 'message' => 'You should insert username and password');
        }

        $user = Teachers::where('username',$username)->first();

        if ($user == null){
            return $this->responseError('The username not exist!');
        }else{
            if (Hash::check($password,$user->password)){
                //$teacher = Teachers::where('user_id',$user->id)->get();
                //$user->teacher = $teacher;
                return array('status' => true ,'user' => $user);
            }else{
                return $this->responseError('The username and password not match');
            }
        }
    }

    function get_semesters(Request $request){
        $semesters = Semesters::with('courses')->where(['semesters.enabled'=>true])->get()->toArray();
        return $this->responseCustom(true,$semesters,"");
    }

    function get_semester_course(Request $request){
        $courses = Courses::where(['semester_id'=>$request->semester_id])->get()->toArray();
        return $this->responseCustom(true,$courses,"");
    }
}
