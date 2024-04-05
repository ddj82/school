    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: rgba(0, 0, 0, 0);
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    header {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
    
    nav.navbar {
    	margin-bottom: 0;
	}
	
	.col-sm-3 {
    	width: 15%;
	}
	
	.container-fluid {
	    position: fixed;
	    width: 100%;
	}
	
	#li-1 a:hover, 
	#li-2 a:hover, 
	#li-3 a:hover, 
	#li-4 a:hover, 
	#li-5 a:hover {
		background-color: transparent;
		color: #3a46ff;
	}