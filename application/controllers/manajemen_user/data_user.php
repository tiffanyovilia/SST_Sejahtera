<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Data_user extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->fungsi->restrict();
		$this->load->model('manajemen_user/m_data_user');
	}

	public function index()
	{
		$this->fungsi->check_previleges('data_user');
		$data['data_user'] = $this->m_data_user->getData();
		$this->load->view('manajemen_user/data_user/v_data_user_list',$data);
	}

	public function form($param='')
	{
		$content   = "<div id='divsubcontent'></div>";
		$header    = "Form Data User";
		$subheader = "Data User";
		$buttons[] = button('jQuery.facebox.close()','Tutup','btn btn-default','data-dismiss="modal"');
		echo $this->fungsi->parse_modal($header,$subheader,$content,$buttons,"");
		if($param=='base'){
			$this->fungsi->run_js('load_silent("manajemen_user/data_user/show_addForm/","#divsubcontent")');	
		}else{
			$base_kom=$this->uri->segment(5);
			$this->fungsi->run_js('load_silent("manajemen_user/data_user/show_editForm/'.$base_kom.'","#divsubcontent")');	
		}
	}

	public function show_addForm()
	{
		$this->fungsi->check_previleges('data_user');
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
			$this->load->view('manajemen_user/data_user/v_data_user_add',$data);
		}
		else
		{
			$datapost = get_post_data(array('no','id','level','id_pegawai','nama','email'));
			$this->m_data_user->insertData($datapost);
			$this->fungsi->run_js('load_silent("manajemen_user/data_user","#content")');
			$this->fungsi->message_box("Data barang keluar sukses disimpan...","success");
            $this->fungsi->catat($datapost,"Menambah data barang keluar dengan data sbb:",true);
        }
	}

	public function show_editForm($id='')
	{
		$this->fungsi->check_previleges('data_user');
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
			$data['edit'] = $this->db->get_where('data_user',array('id'=>$id));
			$data['status']='';
			$this->load->view('manajemen_user/data_user/v_data_user_edit',$data);
		}
		else
		{
			$datapost = get_post_data(array('no','id','level','id_pegawai','nama','email'));
			$this->m_data_user->updateData($datapost);
			$this->fungsi->run_js('load_silent("manajemen_user/data_user","#content")');
			$this->fungsi->message_box("Data barang keluar sukses diperbarui...","success");
            $this->fungsi->catat($datapost,"Mengedit data barang keluar dengan data sbb:",true);   
        }  
    }

    public function delete()
            {
                $id = $this->uri->segment(4);
                $this->m_data_user->deleteData($id);
                redirect('admin');
            }
} 