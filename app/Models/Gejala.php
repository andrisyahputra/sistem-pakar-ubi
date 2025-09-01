<?php

namespace App\Models;

use CodeIgniter\Model;

class Gejala extends Model
{
    protected $table = 'gejala';
    protected $primaryKey = 'kode_gejala';
    protected $useAutoIncrement = true;
    protected $returnType = 'array';
    protected $useSoftDeletes = false;

    // HANYA field ini yang boleh di-insert/update
    protected $protectFields = true;
    protected $allowedFields = ['kode_gejala', 'nama_gejala'];

    // Matikan timestamps jika tabel tidak punya kolomnya
    protected $useTimestamps = true;


    // public function getRelasiPengetahuan()
    // {
    //     return $this->db->table('basispengetahuans bp')
    //         ->select('g.kode_gejala, bp.kode_pengetahuan, p.nama_penyakit, g.nama_gejala, bp.mb, bp.md, bp.cf, p.kode_penyakit')
    //         ->join('penyakits p', 'bp.kode_penyakit = p.kode_penyakit')
    //         ->join('gejala g', 'bp.kode_gejala = g.kode_gejala')
    //         ->orderBy('p.nama_penyakit', 'ASC')
    //         ->orderBy('g.kode_gejala', 'ASC')
    //         ->get()
    //         ->getResultArray();
    // }
    public function getRelasiPengetahuan($id = null)
    {
        $builder = $this->db->table('basispengetahuans bp')
            ->select('g.kode_gejala, bp.kode_pengetahuan, p.nama_penyakit, g.nama_gejala, bp.mb, bp.md, bp.cf, p.kode_penyakit')
            ->join('penyakits p', 'bp.kode_penyakit = p.kode_penyakit')
            ->join('gejala g', 'bp.kode_gejala = g.kode_gejala')
            ->orderBy('g.kode_gejala', 'ASC');

        // Jika $id dikirim, filter berdasarkan ID
        if ($id !== null) {
            $builder->where('g.kode_gejala', $id);  // pastikan kolom ID sesuai di tabel basispengetahuans
        }

        return $builder->get()->getResultArray();
    }
}