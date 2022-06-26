<?php 
namespace App\Database\Seeds;

class PelangganSeeder extends \CodeIgniter\Database\Seeder{

    public function run()
    {
        $options = [
            'cost'=>10,

        ];

        $data=[
            'nama'      => 'Muhammad Anjar',
            'no_tlp'   => '081294176339',
            'email'     => 'anjarfals07@gmail.com',
            'password'  => password_hash('123456', PASSWORD_DEFAULT, $options),
            'status'    => '1',
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
        ];

        $this->db->table('pelanggan')->insert($data);
    }
}
?>