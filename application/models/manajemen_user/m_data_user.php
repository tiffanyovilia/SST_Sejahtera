<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_data_user extends CI_Model {
	
	//select->read
	public function getData($value='')
	{
		$this->db->from('user ma');
		$this->db->order_by('ma.id', 'desc');
		return $this->db->get();
	}

    //insert->create
	public function insertData($data='')
	{	
        $this->db->insert('user',$data);  
	}
	
	//update
	public function updateData($data='')
	{
		 $this->db->where('id',$data['id']);
            $this->db->update('user',$data);
	}

	//delete
	public function deleteData($id='')
	{
		$this->db->where('id', $id);
        $this->db->delete('user');
	}

}