<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Data_pegawai extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->fungsi->restrict();
		$this->load->model('master_data/m_data_pegawai');
	}

	public function index()
	{
		$this->fungsi->check_previleges('data_pegawai');
		$data['data_pegawai'] = $this->m_data_pegawai->getData();
		$this->load->view('master_data/data_pegawai/v_data_pegawai_list',$data);
	}

	public function form($param='')
	{
		$content   = "<div id='divsubcontent'></div>";
		$header    = "Form Data Pegawai";
		$subheader = "Data Pegawai";
		$buttons[] = button('jQuery.facebox.close()','Tutup','btn btn-default','data-dismiss="modal"');
		echo $this->fungsi->parse_modal($header,$subheader,$content,$buttons,"");
		if($param=='base'){
			$this->fungsi->run_js('load_silent("master_data/data_pegawai/show_addForm/","#divsubcontent")');	
		}else{
			$base_kom=$this->uri->segment(5);
			$this->fungsi->run_js('load_silent("master_data/data_pegawai/show_editForm/'.$base_kom.'","#divsubcontent")');	
		}
	}

	public function show_addForm()
	{
		$this->fungsi->check_previleges('data_pegawai');
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
			$this->load->view('master_data/data_pegawai/v_data_pegawai_add',$data);
		}
		else
		{
			$datapost = get_post_data(array('no','id','nama_pegawai','jabatan','alamat','nomor_telepon'));
			$this->m_data_pegawai->insertData($datapost);
			$this->fungsi->run_js('load_silent("master_data/data_pegawai","#content")');
			$this->fungsi->message_box("Data pegawai sukses disimpan...","success");
            $this->fungsi->catat($datapost,"Menambah data pegawai dengan data sbb:",true);
        }
	}

	public function show_editForm($id='')
	{
		$this->fungsi->check_previleges('data_pegawai');
		$this->load->library('form_validation');
		$config = array(
				array(
					'field'	=> 'id',
					'label' => 'id',
					'rules' => ''
				),
				array(
					'field'	=> 'nama_pegawai',
					'label' => 'nama_pegawai',
					'rules' => 'required'
				)
			);
		$this->form_validation->set_rules($config);
		$this->form_validation->set_error_delimiters('<span class="error-span">', '</span>');

		if ($this->form_validation->run() == FALSE)
		{
			$data['edit'] = $this->db->get_where('pegawai',array('id'=>$id));
			$data['status']='';
			$this->load->view('master_data/data_pegawai/v_data_pegawai_edit',$data);
		}
		else
		{
			$datapost = get_post_data(array('no','id','nama_pegawai','jabatan','alamat','nomor_telepon'));
			$this->m_data_pegawai->updateData($datapost);
			$this->fungsi->run_js('load_silent("master_data/data_pegawai","#content")');
			$this->fungsi->message_box("Data pegawai sukses diperbarui...","success");
            $this->fungsi->catat($datapost,"Mengedit data pegawai dengan data sbb:",true);   
        }  
    }

    public function delete()
            {
                $id = $this->uri->segment(4);
                $this->m_data_pegawai->deleteData($id);
                redirect('admin');
            }
} 