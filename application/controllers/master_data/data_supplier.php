<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Data_supplier extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->fungsi->restrict();
		$this->load->model('master_data/m_data_supplier');
	}

	public function index()
	{
		$this->fungsi->check_previleges('data_supplier');
		$data['data_supplier'] = $this->m_data_supplier->getData();
		$this->load->view('master_data/data_supplier/v_data_supplier_list',$data);
	}

	public function form($param='')
	{
		$content   = "<div id='divsubcontent'></div>";
		$header    = "Form Master Data";
		$subheader = "Data Supplier";
		$buttons[] = button('jQuery.facebox.close()','Tutup','btn btn-default','data-dismiss="modal"');
		echo $this->fungsi->parse_modal($header,$subheader,$content,$buttons,"");
		if($param=='base'){
			$this->fungsi->run_js('load_silent("master_data/data_supplier/show_addForm/","#divsubcontent")');	
		}else{
			$base_kom=$this->uri->segment(5);
			$this->fungsi->run_js('load_silent("master_data/data_supplier/show_editForm/'.$base_kom.'","#divsubcontent")');	
		}
	}

	public function show_addForm()
	{
		$this->fungsi->check_previleges('data_supplier');
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
			$this->load->view('master_data/data_supplier/v_data_supplier_add',$data);
		}
		else
		{
			$datapost = get_post_data(array('no','id','nama_supplier','nomor_telepon','alamat'));
			$this->m_data_supplier->insertData($datapost);
			$this->fungsi->run_js('load_silent("master_data/data_supplier","#content")');
			$this->fungsi->message_box("Data supplier sukses disimpan...","success");
            $this->fungsi->catat($datapost,"Menambah data supplier dengan data sbb:",true);
        }
	}

	public function show_editForm($id='')
	{
		$this->fungsi->check_previleges('data_supplier');
		$this->load->library('form_validation');
		$config = array(
				array(
					'field'	=> 'id',
					'label' => 'id',
					'rules' => ''
				),
				array(
					'field'	=> 'nama_supplier',
					'label' => 'nama_supplier',
					'rules' => 'required'
				)
			);
		$this->form_validation->set_rules($config);
		$this->form_validation->set_error_delimiters('<span class="error-span">', '</span>');

		if ($this->form_validation->run() == FALSE)
		{
			$data['edit'] = $this->db->get_where('supplier',array('id'=>$id));
			$data['status']='';
			$this->load->view('master_data/data_supplier/v_data_supplier_edit',$data);
		}
		else
		{
			$datapost = get_post_data(array('no','id','nama_supplier','nomor_telepon','alamat'));
			$this->m_data_supplier->updateData($datapost);
			$this->fungsi->run_js('load_silent("master_data/data_supplier","#content")');
			$this->fungsi->message_box("Data supplier sukses diperbarui...","success");
            $this->fungsi->catat($datapost,"Mengedit data supplier dengan data sbb:",true);   
        }  
    }

    public function delete()
            {
                $id = $this->uri->segment(4);
                $this->m_data_supplier->deleteData($id);
                redirect('admin');
            }
} 