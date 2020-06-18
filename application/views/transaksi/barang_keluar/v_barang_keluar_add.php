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
            <label class="col-sm-4 control-label">ID Transaksi</label>
            <div class="col-sm-8">
            <?php echo form_input(array('name'=>'id','class'=>'form-control'));?>
            <?php echo form_error('id');?>
            <span id="check_data"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">Tanggal Keluar</label>
            <div class="col-sm-8">
            <?php echo form_input(array('name'=>'tanggal_keluar','class'=>'form-control'));?>
            <?php echo form_error('tanggal_keluar');?>
            <span id="check_data"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">ID Pegawai</label>
            <div class="col-sm-8">
            <?php echo form_input(array('name'=>'id_pegawai','class'=>'form-control'));?>
            <?php echo form_error('id_pegawai');?>
            <span id="check_data"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">ID Barang</label>
            <div class="col-sm-8">
            <?php echo form_input(array('name'=>'id_barang','class'=>'form-control'));?>
            <?php echo form_error('id_barang');?>
            <span id="check_data"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">Jumlah</label>
            <div class="col-sm-8">
            <?php echo form_input(array('name'=>'jumlah','class'=>'form-control'));?>
            <?php echo form_error('jumlah');?>
            <span id="check_data"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">Harga Jual</label>
            <div class="col-sm-8">
            <?php echo form_input(array('name'=>'harga_jual','class'=>'form-control'));?>
            <?php echo form_error('harga_jual');?>
            <span id="check_data"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">Simpan</label>
            <div class="col-sm-8 tutup">
            <?php echo button('send_form(document.faddmenugrup,"transaksi/barang_jual/show_addForm/","#divsubcontent")','Simpan','btn btn-warning')."";?>
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