<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\Admin\PelangganModel;

class Pelanggan extends BaseController
{
    protected $halaman;
    protected $title;
    protected $pelanggan;


    public function __construct()
    {
        $this->halaman = 'pelanggan';
        $this->title = 'Pelanggan';

        $this->pelanggan = new PelangganModel();
    }


    public function index()
    {
        $data = [
            'halaman'   => $this->halaman,
            'title'     => $this->title,
            'main'      => 'pelanggan/index'
        ];
        return view('layout/template', $data);
    }

    public function ajaxList()
    {
        $draw   = $_REQUEST['draw'];
        $length = $_REQUEST['length'];
        $start  = $_REQUEST['start'];
        $search = $_REQUEST['search']['value'];

        $total = $this->pelanggan->ajaxGetTotal();
        $output = [
            'length'            => $length,
            'draw'              => $draw,
            'recordsTotal'      => $total,
            'recordsFiltered'   => $total
        ];

        if ($search !== '') {
            $list = $this->pelanggan->ajaxGetDataSearch($search, $length, $start);
        } else {
            $list = $this->pelanggan->ajaxGetData($length, $start);
        }

        if ($search !== '') {
            $total_search =  $this->pelanggan->ajaxGetTotalSearch($search);
            $output = [
                'recordsTotal'      => $total_search,
                'recordsFiltered'   => $total_search
            ];
        }
        $data = [];
        $no = $start + 1;
        foreach ($list as $temp) {
            $aksi = '
            <div class="text-center">
                 <a href="javascript:void(0)" class="btn btn-danger btn-sm" data-toggle="tooltip" title="Hapus Data" onclick="ajaxDelete(' . $temp['id'] . ')">
                     <i class="fa fa-trash-o"></i>
                </a>
            </div>    
            ';

            $status = '
            <div class="text-center">
                 <a href="javascript:void(0)" data-toggle="tooltip" title="' . ($temp['status'] == '0' ? 'Aktif' : 'Non-Aktif') . '" onclick="ajaxStatus(' . $temp['id'] . ')">
                 ' . formatStatus($temp['status']) . '
                 </a>
            </div>    
            ';
            $row    = [];
            $row[]  = $no++;
            $row[]  = $temp['nama'];
            $row[]  = $temp['no_tlp'];
            $row[]  = $temp['email'];
            $row[]  = $status;
            $row[]  = $aksi;

            $data[] = $row;
        }
        $output['data'] = $data;
        echo json_encode($output);
        exit();
    }

    // public function ajaxSave()
    // {
    //     $this->_validate('save');
    //     $data = [
    //         'nama_kategori' => $this->request->getVar('nama_kategori'),
    //         'status' => '1'
    //     ];

    //     if ($this->kategori->save($data)) {
    //         echo json_encode(['status' => TRUE]);
    //     } else {
    //         echo json_encode(['status' => FALSE]);
    //     }
    // }

    // public function ajaxEdit($id)
    // {
    //     $kategori = $this->kategori->find($id);
    //     echo json_encode($kategori);
    // }

    // public function ajaxUpdate()
    // {
    //     $this->_validate('save');
    //     $data = [
    //         'id' => $this->request->getVar('id'),
    //         'nama_kategori' => $this->request->getVar('nama_kategori')
    //     ];

    //     if ($this->kategori->save($data)) {
    //         echo json_encode(['status' => TRUE]);
    //     } else {
    //         echo json_encode(['status' => FALSE]);
    //     }
    // }

    public function ajaxDelete($id)
    {
        if ($this->pelanggan->delete($id)) {
            echo json_encode(['status' => TRUE]);
        } else {
            echo json_encode(['status' => FALSE]);
        }
    }

    public function ajaxStatus($id)
    {
        $pelanggan = $this->pelanggan->find($id);
        $data['id'] = $id;

        if ($pelanggan['status'] == '0') {
            $data['status'] = '1';
            $result = $this->pelanggan->save($data);
        } else {
            $data['status'] = '0';
            $result = $this->pelanggan->save($data);
        }

        if ($result) {
            echo json_encode(array('status' => TRUE));
        } else {
            echo json_encode(array('status' => FALSE));
        }
    }

    // public function _validate($method)
    // {
    //     if (!$this->validate($this->kategori->getRulesValidation($method))) {
    //         $validation = \Config\Services::validation();

    //         $data = [];
    //         $data['error_string'] = [];
    //         $data['inputerror'] = [];
    //         $data['status'] = TRUE;

    //         if ($validation->hasError('nama_kategori')) {
    //             $data['inputerror'][]       = 'nama_kategori';
    //             $data['error_string'][]     = $validation->getError('nama_kategori');
    //             $data['status']             = FALSE;
    //         }

    //         if ($data['status'] == FALSE) {
    //             echo json_encode($data);
    //             exit();
    //         }
    //     }
    // }
}
