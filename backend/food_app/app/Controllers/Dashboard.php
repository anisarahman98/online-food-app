<?php

namespace App\Controllers;

class Dashboard extends BaseController
{
    protected $title;
    protected $halaman;


    public function __construct()
    {
        $this->title = 'Dashboard';
        $this->halaman = 'dashboard';
    }

    public function index()
    {
        $data = [
            'halaman'   => $this->halaman,
            'title'     => $this->title,
            'main'      => 'dashboard/index'
        ];
        return view('layout/template', $data);
    }
}
