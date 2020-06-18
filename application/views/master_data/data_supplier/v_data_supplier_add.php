<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<div class="box-body big">
    <?php echo form_open('',array('name'=>'faddmenugrup','class'=>'form-horizontal','role'=>'form'));?>
        
        <div class="form-group">
            <label class="col-sm-4 control-label">No</label>
            <div class="col-sm-8">
            <?php echo form_input(array('name'=>'no','class'=>'form-control'));?>
            <?php echo form_error('no');?>
            <span id="check_data"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">ID Supplier</label>
            <div class="col-sm-8">
            <?php echo form_input(array('name'=>'id','class'=>'form-control'));?>
            <?php echo form_error('id');?>
            <span id="check_data"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">Nama Supplier</label>
            <div class="col-sm-8">
            <?php echo form_input(array('name'=>'nama_supplier','class'=>'form-control'));?>
            <?php echo form_error('nama_supplier');?>
            <span id="check_data"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">Nomor Telepon</label>
            <div class="col-sm-8">
            <?php echo form_input(array('name'=>'nomor_telepon','class'=>'form-control'));?>
            <?php echo form_error('nomor_telepon');?>
            <span id="check_data"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">Alamat</label>
            <div class="col-sm-8">
            <?php echo form_input(array('name'=>'alamat','class'=>'form-control'));?>
            <?php echo form_error('alamat');?>
            <span id="check_data"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">Simpan</label>
            <div class="col-sm-8 tutup">
            <?php echo button('send_form(document.faddmenugrup,"master_data/data_supplier/show_addForm/","#divsubcontent")','Simpan','btn btn-warning')."";?>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
$(document).ready(function() {
    $('.tutup').click(function(e) {  
        $('#myModal').modal('hide');
    });
});
</script>