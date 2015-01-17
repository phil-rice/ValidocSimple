<script type="text/javascript">
  $("input").on("keyup", function(event){
     var fullText = ""
     $("input").each(function (index) { fullText += this.value })
     var fullDigest =  Sha1.hash(fullText, "UTF-8")
     document.getElementById("cuba_full_digest").innerHTML = fullDigest
     var digest = Sha1.hash(fullDigest+event.target.value, "UTF-8")
     document.getElementById(event.target.name).innerHTML=digest
     console.log( "You changed paragraph " + event.target.name + " to " + event.target.value +" producing " + digest + " full text is " + fullText); 
     }
  )
</script>