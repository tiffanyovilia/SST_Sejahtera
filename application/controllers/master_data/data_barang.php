<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Data_barang extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->fungsi->restrict();
		$this->load->model('master_data/m_data_barang');
	}

	public function index()
	{
		$this->fungsi->check_previleges('data_barang');
		$data['data_barang'] = $this->m_data_barang->getData();
		$this->load->view('master_data/data_barang/v_data_barang_list',$data);
	}

	public function form($param='')
	{
		$content   = "<div id='divsubcontent'></div>";
		$header    = "Form Master Data";
		$subheader = "Data Barang";
		$buttons[] = button('jQuery.facebox.close()','Tutup','btn btn-default','data-dismiss="modal"');
		echo $this->fungsi->parse_modal($header,$subheader,$content,$buttons,"");
		if($param=='base'){
			$this->fungsi->run_js('load_silent("master_data/data_barang/show_addForm/","#divsubcontent")');	
		}else{
			$base_kom=$this->uri->segment(5);
			$this->fungsi->run_js('load_silent("master_data/data_barang/show_editForm/'.$base_kom.'","#divsubcontent")');	
		}
	}

	public function show_addForm()
	{
		$this->fungsi->check_previleges('data_barang');
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
			$this->load->view('master_data/data_barang/v_data_barang_add',$data);
		}
		else
		{
			$datapost = get_post_data(array('no','id','nama_barang','merk','jenis','stok','satuan'));
			$this->m_data_barang->insertData($datapost);
			$this->fungsi->run_js('load_silent("master_data/data_barang","#content")');
			$this->fungsi->message_box("Data barang sukses disimpan...","success");
            $this->fungsi->catat($datapost,"Menambah master satuan dengan data sbb:",true);
        }
	}

	public function show_editForm($id='')
	{
		$this->fungsi->check_previleges('data_barang');
		$this->load->library('form_validation');
		$config = array(
				array(
					'field'	=> 'id',
					'label' => 'id',
					'rules' => ''
				),
				array(
					'field'	=> 'nama_barang',
					'label' => 'nama_barang',
					'rules' => 'required'
				)
			);
		$this->form_validation->set_rules($config);
		$this->form_validation->set_error_delimiters('<span class="error-span">', '</span>');

		if ($this->form_validation->run() == FALSE)
		{
			$data['edit'] = $this->db->get_where('barang',array('id'=>$id));
			$data['status']='';
			$this->load->view('master_data/data_barang/v_data_barang_edit',$data);
		}
		else
		{
			$datapost = get_post_data(array('no','id','nama_barang','merk','jenis','stok','satuan'));
			$this->m_data_barang->updateData($datapost);
			$this->fungsi->run_js('load_silent("master_data/data_barang","#content")');
			$this->fungsi->message_box("Data barang sukses diperbarui...","success");
            $this->fungsi->catat($datapost,"Mengedit master satuan dengan data sbb:",true);   
        }  
    }

    public function delete()
            {
                $id = $this->uri->segment(4);
                $this->m_data_barang->deleteData($id);
                redirect('admin');
            }
}