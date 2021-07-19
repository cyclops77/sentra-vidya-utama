<?php

namespace App;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class PostComment extends Model
{
    protected $guarded = [];
    public function userComment()
    {
        return $this->belongsTo('App\User','user_id');
    }
    public function getCreatedAtAttribute($value){
        return Carbon::createFromFormat('Y-m-d H:i:s', $value)->diffForHumans();
    }
}
