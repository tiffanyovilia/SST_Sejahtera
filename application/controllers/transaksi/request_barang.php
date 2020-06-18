<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Request_barang extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->fungsi->restrict();
		$this->load->model('transaksi/m_request_barang');
	}

	public function index()
	{
		$this->fungsi->check_previleges('request_barang');
		$data['request_barang'] = $this->m_request_barang->getData();
		$this->load->view('transaksi/request_barangr/v_request_barang_list',$data);
	}

	public function form($param='')
	{
		$content   = "<div id='divsubcontent'></div>";
		$header    = "Form Request Barang";
		$subheader = "Request Barang";
		$buttons[] = button('jQuery.facebox.close()','Tutup','btn btn-default','data-dismiss="modal"');
		echo $this->fungsi->parse_modal($header,$subheader,$content,$buttons,"");
		if($param=='base'){
			$this->fungsi->run_js('load_silent("transaksi/request_barang/show_addForm/","#divsubcontent")');	
		}else{
			$base_kom=$this->uri->segment(5);
			$this->fungsi->run_js('load_silent("transaksi/request_barang/show_editForm/'.$base_kom.'","#divsubcontent")');	
		}
	}

	public function show_addForm()
	{
		$this->fungsi->check_previleges('request_barang');
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
			$this->load->view('transaksi/request_barang/v_request_barang_add',$data);
		}
		else
		{
			$datapost = get_post_data(array('no','id','tanggal_request','id_barang','status'));
			$this->m_request_barang->insertData($datapost);
			$this->fungsi->run_js('load_silent("transaksi/request_barang","#content")');
			$this->fungsi->message_box("Data request barang sukses disimpan...","success");
            $this->fungsi->catat($datapost,"Menambah data request barang dengan data sbb:",true);
        }
	}

	public function show_editForm($id='')
	{
		$this->fungsi->check_previleges('request_barang');
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
			$data['edit'] = $this->db->get_where('request_barang',array('id'=>$id));
			$data['status']='';
			$this->load->view('transaksi/request_barang/v_request_barang_edit',$data);
		}
		else
		{
			$datapost = get_post_data(array('no','id','tanggal_request','id_barang','status'));
			$this->m_request_barang->updateData($datapost);
			$this->fungsi->run_js('load_silent("transaksi/request_barang","#content")');
			$this->fungsi->message_box("Data request barang sukses diperbarui...","success");
            $this->fungsi->catat($datapost,"Mengedit data request barang dengan data sbb:",true);   
        }  
    }

    public function delete()
            {
                $id = $this->uri->segment(4);
                $this->m_request_barang->deleteData($id);
                redirect('admin');
            }
} 