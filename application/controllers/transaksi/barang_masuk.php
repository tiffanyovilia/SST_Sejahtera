<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Barang_masuk extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->fungsi->restrict();
		$this->load->model('transaksi/m_barang_masuk');
	}

	public function index()
	{
		$this->fungsi->check_previleges('barang_masuk');
		$data['barang_masuk'] = $this->m_barang_masuk->getData();
		$this->load->view('transaksi/barang_masuk/v_barang_masuk_list',$data);
	}

	public function form($param='')
	{
		$content   = "<div id='divsubcontent'></div>";
		$header    = "Form Barang Masuk";
		$subheader = "Data Barang Masuk";
		$buttons[] = button('jQuery.facebox.close()','Tutup','btn btn-default','data-dismiss="modal"');
		echo $this->fungsi->parse_modal($header,$subheader,$content,$buttons,"");
		if($param=='base'){
			$this->fungsi->run_js('load_silent("transaksi/barang_masuk/show_addForm/","#divsubcontent")');	
		}else{
			$base_kom=$this->uri->segment(5);
			$this->fungsi->run_js('load_silent("transaksi/barang_masuk/show_editForm/'.$base_kom.'","#divsubcontent")');	
		}
	}

	public function show_addForm()
	{
		$this->fungsi->check_previleges('barang_masuk');
		$this->load->library('form_validation');
		$config = array(
				array(
					'field'	=> 'id',
					'label' => 'id',
					'rules' => 'required'
				)
			);
		$this->form_validation->set_rules($config);
		$this->form_validation->set_error_delimiters('<span class="error-span">', '</span>');

		if ($this->form_validation->run() == FALSE)
		{
			$data['status']='';
			$this->load->view('transaksi/barang_masuk/v_barang_masuk_add',$data);
		}
		else
		{
			$datapost = get_post_data(array('no','id','tanggal_masuk','id_supplier','id_barang','jumlah','harga_beli'));
			$this->m_barang_masuk->insertData($datapost);
			$this->fungsi->run_js('load_silent("transaksi/barang_masuk","#content")');
			$this->fungsi->message_box("Data barang masuk sukses disimpan...","success");
            $this->fungsi->catat($datapost,"Menambah data barang masuk dengan data sbb:",true);
        }
	}

	public function show_editForm($id='')
	{
		$this->fungsi->check_previleges('barang_masuk');
		$this->load->library('form_validation');
		$config = array(
				array(
					'field'	=> 'id',
					'label' => 'id',
					'rules' => 'required'
				)
			);
		$this->form_validation->set_rules($config);
		$this->form_validation->set_error_delimiters('<span class="error-span">', '</span>');

		if ($this->form_validation->run() == FALSE)
		{
			$data['edit'] = $this->db->get_where('barang_masuk',array('id'=>$id));
			$data['status']='';
			$this->load->view('transaksi/barang_masuk/v_barang_masuk_edit',$data);
		}
		else
		{
			$datapost = get_post_data(array('no','id','tanggal_masuk','id_supplier','id_barang','jumlah','harga_beli'));
			$this->m_barang_masuk->updateData($datapost);
			$this->fungsi->run_js('load_silent("transaksi/barang_masuk","#content")');
			$this->fungsi->message_box("Data barang masuk sukses diperbarui...","success");
            $this->fungsi->catat($datapost,"Mengedit data barang masuk dengan data sbb:",true);   
        }  
    }

    public function delete()
            {
                $id = $this->uri->segment(4);
                $this->m_barang_masuk->deleteData($id);
                redirect('admin');
            }
} 