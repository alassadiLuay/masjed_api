<?php

namespace App\Http\Controllers;

use App\AdminUsers;
use App\Teachers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class BaseController extends Controller
{

    function responseCustom($status,$data,$message){
        header('Content-type: application/json');

        $res = array("status" => boolval($status), "data" => $data, "message" => $message);

        return response()->json($res);
    }

    function responseError($message){
        return $this->responseCustom(false, null, $message);
    }



    function isAuthorized(Request $request)
    {
        $username = $request->headers->get('Php-Auth-User');
        $password = $request->headers->get('Php-Auth-pw');

        if (is_null($username) || is_null($password)) {
            return array('status' => false, 'message' => 'You should authorization');
        }

        $user = AdminUsers::where('email',$username)->first();

        if ($user != null && Hash::check($password,$user['password'])){

            $teacher = Teachers::where('user_id',$user->id)->get();
            $user->teacher = $teacher;

            return array('status' => true ,'user' => $user);
        }else{
            return array('status' => false, 'message' => 'Not authorized');
        }

    }

}