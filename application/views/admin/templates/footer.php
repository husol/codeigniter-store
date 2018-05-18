				</div>
			</div>
			<div class="clr"></div>
			<div id="overlay"></div>
			<footer>
                In case of difficulty, please contact
                <a href="mailto:enquiry@husol.org">enquiry@husol.org</a><br>
                Copyright © <?php echo date("Y"); ?> by <a href="http://husol.org" target="_blank">Husol Organization.</a><br>
                All rights reserved. 
            </footer>
		</div>
		<script src="asset/js/bootstrap.min.js"></script>
        <script src="asset/js/jquery.fancybox.pack.js"></script>
		<?php if(isset($extra_js)){
			foreach($extra_js as $js){?>
				<script src="asset/js/<?php echo $js?>"></script>
			<?php }
            } ?>
		<script src="asset/js/admin.js"></script>
	</body>
</html>