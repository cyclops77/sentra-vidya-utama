<?php

use \App\Post;
use \App\PostLike;
use Illuminate\Database\Seeder;

class PostsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Post::create([
            'user_id' => 1,
            'image' => '1.png',
            'value' => 'ini',            
        ]);Post::create([
            'user_id' => 2,
            'image' => '2.jpeg',
            'value' => 'ini',            
        ]);Post::create([
            'user_id' => 3,
            'image' => '3.jpeg',
            'value' => 'ini',            
        ]);
        
        
    }
}
