<?php

use \App\PostComment;
use Illuminate\Database\Seeder;

class CommentTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        PostComment::create([
            'user_id' => 1,
            'post_id' => 1,
            'value' => 'valid_lft forever preferred_lft forever root@al:/media/al/hd/PretesKerja/Sevima/Webservices# php artisan migrate:refresh --seed^C',
        ]);
        PostComment::create([
            'user_id' => 2,
            'post_id' => 1,
            'value' => 'Encryption keys already exist. Use the --force option to overwrite them',
        ]);
        PostComment::create([
            'user_id' => 1,
            'post_id' => 2,
            'value' => 'The Lumen framework has a few system requirements. Of course, all of these requirements are satisfied by the Laravel Homestead virtual machine, so its highly recommended that you use Homestead as your local Lumen development environment.',
        ]);
        PostComment::create([
            'user_id' => 3,
            'post_id' => 3,
            'value' => "The next thing you should do after installing Lumen is set your application key to a random string. Typically, this string should be 32 characters long. The key can be set in the .env environment file. If you have not renamed the .env.example file to .env, you should do that now. If the application key is not set, your user encrypted data will not be secure!",
        ]);
        PostComment::create([
            'user_id' => 4,
            'post_id' => 2,
            'value' => "Since Lumen is a totally separate framework from Laravel, it does not intentionally offer compatibility with any additional Laravel libraries like Cashier, Passport, Scout, etc. If your application requires the functionality provided by these libraries, please use the Laravel framework.",
        ]);
        PostComment::create([
            'user_id' => 2,
            'post_id' => 1,
            'value' => 'Laravel is a trademark of Taylor Otwell. Copyright © Taylor Otwell.',
        ]);
        PostComment::create([
            'user_id' => 4,
            'post_id' => 3,
            'value' => "Server Requirements The Lumen framework has a few system requirements. Of course, all of these requirements are satisfied by the Laravel Homestead virtual machine, so it's highly recommended that you use Homestead as your local Lumen development environment.",
        ]);
        PostComment::create([
            'user_id' => 3,
            'post_id' => 2,
            'value' => "However, if you are not using Homestead, you will need to make sure your server meets the following requirements:",
        ]);
        PostComment::create([
            'user_id' => 2,
            'post_id' => 2,
            'value' => "Service providers are the central ",
        ]);
        PostComment::create([
            'user_id' => 1,
            'post_id' => 2,
            'value' => "But, what do we mean by bootstrapped? In general, we mean registering things, including registering service container bindings, event listeners, middleware, and even routes. Service providers are the central place to configure your application.If you open the bootstrap/app.php file included with Lumen, you will see a call to app->register(). You may add additional calls to this method to register as many service providers as your application requires.",
        ]);
    }
}
