<?php
use Illuminate\Support\Facades\Hash;
use \App\User;
use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'name' => 'Moch Alfian Ferdiansyah',
            'username' => 'fianfrdn_',
            'email' => 'a@a.com',
            'password' => Hash::make('a'),
        ]);
        User::create([
            'name' => 'Titania Oktaviani',
            'username' => 'titaniaynd',
            'email' => 'b@b.com',
            'password' => Hash::make('a'),
        ]);
        User::create([
            'name' => 'Kopi Luwak',
            'username' => 'kopiluwak',
            'email' => 'c@c.com',
            'password' => Hash::make('a'),
        ]);
        User::create([
            'name' => 'Sambal Eddy',
            'username' => 'sambaledy_77',
            'email' => 'd@d.com',
            'password' => Hash::make('a'),
        ]);
    }
}
