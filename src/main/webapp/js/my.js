function doLike(pid,uid)
{

const d={
uid:uid,
pid:pid,
operation:'like'
}

$.ajax({

url:"likeServlet",
data:d,
success:  function(data,textStatus,jqXHR){
					console.log(data);
					console.log("success.......................");
			if(data.trim()=='true')
			{
			let c=$(".like-counter").html();
			c++;
			$(".like-counter").html(c);
			}

				},
			error:     function(jqXHR,textStatus,errorThrown){
				console.log(data);
				console.log("error.......................");
			

			}


})
}