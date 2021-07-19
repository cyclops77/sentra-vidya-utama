<?php

namespace App;
use Carbon\Carbon;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $guarded = [];
    
    public function user()
    {
        return $this->belongsTo('App\User');
    }
    public function like()
    {
        return $this->hasMany('App\PostLike','post_id');
    }
    public function comment()
    {
        return $this->hasMany('App\PostComment');
    }
    public function getCreatedAtAttribute($value){
        return Carbon::createFromFormat('Y-m-d H:i:s', $value)->diffForHumans();
    }
}
