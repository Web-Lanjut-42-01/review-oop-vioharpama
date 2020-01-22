<?php 
/**
 * 
 */
class hitungbb{

	function hitung($bmi, $jk){
		if ($jk=="Laki-laki") {
			if ($bmi<17) {
				echo $bmi." || Under Weight/Kurus";
			} elseif ($bmi>=17 && $bmi<=25) {
				echo $bmi." || Normal Weight/Normal";
			} elseif ($bmi>25 && $bmi<=27) {
				echo $bmi." || Over Weight/Kegemukan";
			} elseif ($bmi>27) {
				echo $bmi." || Obesitas";
			}
		} elseif ($jk=="Perempuan") {
			if ($bmi<18) {
				echo $bmi." || Under Weight/Kurus";
			} elseif ($bmi>=18 && $bmi<=25) {
				echo $bmi." || Normal Weight/Normal";
			} elseif ($bmi>25 && $bmi<=27) {
				echo $bmi." || Over Weight/Kegemukan";
			} elseif ($bmi>27) {
				echo $bmi." || Obesitas";
			}
		}
	}

}
$haitsam = new hitungbb(); 
if (isset($_POST['submit'])) {
	$nama=$_POST['nama'];
	$bb= $_POST['bb'];
	$tb = $_POST['tb'];
	$jk = $_POST['jk'];
	$bmi = $bb/($tb*$tb/10000);
	$haitsam->hitung($bmi, $jk);
}
 ?>
