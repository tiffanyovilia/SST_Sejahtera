<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Barang_keluar extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->fungsi->restrict();
		$this->load->model('transaksi/m_barang_keluar');
	}

	public function index()
	{
		$this->fungsi->check_previleges('barang_keluar');
		$data['barang_keluar'] = $this->m_barang_keluar->getData();
		$this->load->view('transaksi/barang_keluar/v_barang_keluar_list',$data);
	}

	public function form($param='')
	{
		$content   = "<div id='divsubcontent'></div>";
		$header    = "Form Barang Keluar";
		$subheader = "Data Barang Keluar";
		$buttons[] = button('jQuery.facebox.close()','Tutup','btn btn-default','data-dismiss="modal"');
		echo $this->fungsi->parse_modal($header,$subheader,$content,$buttons,"");
		if($param=='base'){
			$this->fungsi->run_js('load_silent("transaksi/barang_keluar/show_addForm/","#divsubcontent")');	
		}else{
			$base_kom=$this->uri->segment(5);
			$this->fungsi->run_js('load_silent("transaksi/barang_keluar/show_editForm/'.$base_kom.'","#divsubcontent")');	
		}
	}

	public function show_addForm()
	{
		$this->fungsi->check_previleges('barang_keluar');
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
			$this->load->view('transaksi/barang_keluar/v_barang_keluar_add',$data);
		}
		else
		{
			$datapost = get_post_data(array('no','id','tanggal_keluar','id_pegawai','id_barang','jumlah','harga_jual'));
			$this->m_barang_keluar->insertData($datapost);
			$this->fungsi->run_js('load_silent("transaksi/barang_keluar","#content")');
			$this->fungsi->message_box("Data barang keluar sukses disimpan...","success");
            $this->fungsi->catat($datapost,"Menambah data barang keluar dengan data sbb:",true);
        }
	}

	public function show_editForm($id='')
	{
		$this->fungsi->check_previleges('barang_keluar');
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
			$data['edit'] = $this->db->get_where('barang_keluar',array('id'=>$id));
			$data['status']='';
			$this->load->view('transaksi/barang_keluar/v_barang_keluar_edit',$data);
		}
		else
		{
			$datapost = get_post_data(array('no','id','tanggal_keluar','id_pegawai','id_barang','jumlah','harga_jual'));
			$this->m_barang_keluar->updateData($datapost);
			$this->fungsi->run_js('load_silent("transaksi/barang_keluar","#content")');
			$this->fungsi->message_box("Data barang keluar sukses diperbarui...","success");
            $this->fungsi->catat($datapost,"Mengedit data barang keluar dengan data sbb:",true);   
        }  
    }

    public function delete()
            {
                $id = $this->uri->segment(4);
                $this->m_barang_keluar->deleteData($id);
                redirect('admin');
            }
} 