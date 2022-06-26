<?php

namespace App\Models\Admin;

use CodeIgniter\Model;

class PelangganModel extends Model
{

    protected $table = 'pelanggan';
    protected $allowedFields = ['status'];



    public function ajaxGetData($length, $start)
    {
        $result = $this->orderBy('id', 'desc')->findAll($length, $start);

        return $result;
    }

    public function ajaxGetDataSearch($search, $length, $start)
    {
        $result = $this->like('nama', $search)
            ->like('no_tlp', $search)
            ->like('email', $search)
            ->orderBy('id', 'desc')
            ->findAll($length, $start);

        return $result;
    }

    public function ajaxGetTotal()
    {
        $result = $this->countAll();
        if (isset($result)) {
            return $result;
        }
        return 0;
    }

    public function ajaxGetTotalSearch($search)
    {
        $result = $this->like('nama', $search)
            ->like('no_tlp', $search)
            ->like('email', $search)
            ->countAllResults();

        return $result;
    }
}

/* End of file KategoriModel.php */
