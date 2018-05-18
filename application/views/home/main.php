<?php $this->load->view('home/templates/header'); ?>
<div class="container">
    <div class="col-xs-12 main-col-wrapper pull-right">
        <?if(isset($page_style)){?>
            <?if($page_style == 1){?>
                <div class="content-wrapper">
                    <? $this->load->view('home/blocks/'.$block); ?>
                </div>
            <?}
            if($page_style == 2){?>
                <div id="breadcrumb-wrapper">
                    <ol class="breadcrumb">
                        <?for($i=0;$i<count($this->tree['name']);$i++){?>
                            <?if($i == count($this->tree['name']) - 1){?>
                                <li class="active"><?=$this->tree['name'][$i]?></li>
                            <?}
                            else{?>
                            <li><a href="<?=$this->tree['url'][$i]?>"><?=$this->tree['name'][$i]?></a></li>
                            <?}?>
                        <?}?>
                    </ol>
                </div>

            <?}?>
        <?}?>
    </div>
    <?php $this->load->view('home/templates/sidebar'); ?>
    <div id="floating-up" class="sec-wrapper collapse no-padding"><i class="fa fa-angle-double-up"></i></div>
</div>
<?php $this->load->view('home/templates/footer'); ?>
