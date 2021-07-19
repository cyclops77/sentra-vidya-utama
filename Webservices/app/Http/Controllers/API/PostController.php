<?php

namespace App\Http\Controllers\API;

use \App\Post;
use \App\PostComment;
use \App\PostLike;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Controllers\API\ResponseController as ResponseController;

class PostController extends ResponseController
{
    public function index(Request $r)
    {
        $likes = $r->user()->like->pluck('post_id');
        $data = Post::WithCount('comment')->withCount('like')->with('user')->get();
        return $this->sendResponse(['likes' => $likes, 'data' => $data]);
    }
    public function detail($id)
    {
        $data = Post::whereId($id)
            ->with('user')
            ->with('comment.userComment')
            ->first();
        return $this->sendResponse($data);
    }
    public function store(Request $request)
    {
        $msg = [
            'required' => 'Inputan :attribute wajib diisi',
        ];
        $validator = Validator::make($request->all(), [
            'gambar' => 'required|max:2048',

        ], $msg);
        if ($validator->fails()) {
            return $this->sendError($validator->errors(), 400);
        }else{
            try {
                $file = $request->file('gambar');
                $fileName = substr(md5(microtime()), 0, 100) . '.' . $file->getClientOriginalExtension();
                $request->file('gambar')->storeAs('public/post/', $fileName);
                
                Post::create([
                    'user_id' => $request->user()->id,
                    'image' => $fileName,
                    'value' => $request->value,
                ]);
                return $this->sendResponse('berhasil create');
            } catch (Exception $e) {
                return $this->sendError($e, 400);
            }
        }
    }
    public function update(Request $r)
    {
        Post::whereId($r->id)
        ->update([
            'value' => $r->value,
        ]);
        return $this->sendResponse('ok');
    }
    public function storeComment(Request $r)
    {
        PostComment::create([
            'user_id' => $r->user()->id,
            'post_id' => $r->post_id,
            'value' => $r->value,
        ]);
        return $this->sendResponse('ok');
    }
    public function likePosts(Request $r)
    {
        $exists = PostLike::where('user_id', $r->user()->id)->where('post_id', $r->post_id)->first();
        if ($exists) {
            $exists->delete();
        }else{
            PostLike::create([
                'user_id' => $r->user()->id,
                'post_id' => $r->post_id,
            ]);
        }
        return $this->sendResponse('ok');
    }
    public function showLike($post)
    {
        $data = PostLike::where('post_id', $post)
            ->with('user')
            ->get();
        return $this->sendResponse($data);
    }
}
