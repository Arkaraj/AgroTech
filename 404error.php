<?php require('top.php')?>
<div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(images/bg/4.jpg) no-repeat scroll center center / cover ;">
            <div class="ht__bradcaump__wrap">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="bradcaump__inner">
                                <nav class="bradcaump-inner">
                                  <a class="breadcrumb-item" href="index.php">Home</a>
                                  <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                  <span class="breadcrumb-item active">404</span>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
        <!-- cart-main-area start -->
<div class="body__overlay"></div>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r58/three.min.js"></script>
    <style>
        body {
            background: #f5f5f5;
            font-family: 'Roboto', sans-serif;
        }

        
        .mega,
        .bola {
            line-height: 1.65em;
            font-weight: bold;
            font-size: 11em;
            color: black;
            font-family: 'Roboto', sans-serif;
            width: 300px;
            height: 300px;
            position: absolute;
            left: 40%;
            /* top: 50%; */
            /* margin-left: -150px; */
            margin-top: -50px; 
        }

        .boom {
            color: #f5f5f5;
        }

        .Home {
            color: #000;
            font-size: 1.5em;
            line-height: 9em;
            text-indent: 2.5em;
            position: relative;
            /* left: 20%; */
            margin: 7% 0% 0% 25%;
            /*top: 50%; */
        }

        a {
            text-decoration: none;
            color: #000;
        }
        .mini {
            font-size: 2em;
            color: #000;
            line-height: 9em;
            text-indent: 2.5em;
            /* position: unset; */
            left: 10%;
            bottom: 40%;
            margin: 20px;
        }
        @media(max-width:767px) {
            .mega,
        .bola{
            left: 10%;
        }
        .Home {
            margin: 17% 0% 0% 25%;
        }

    }

        #err {
            background: #2196F3 none repeat scroll 0 0;
            color: #fff;
            position: relative;
            display: inline-block;
            font-family: 'Poppins';
            font-size: 15px;
            height: 50px;
            line-height: 50px;
            padding: 0 36px;
            border-radius: 12px;
            transition: 0.3s;
            margin-top: 10%;
            border: none;
        }

        #err:hover {
            border-color: black;
            background: #eee;
        }
    </style>
    <title>Web Page Not found</title>
</head>

<body>
    <p class="mega">4<span class="boom">0</span>4<div class="bola">
        </div>
    </p>
    <b>Sorry the Webpage was not found!</b>
    <!-- <p class="mini">Sorry the Webpage was not found!</p>  -->
    <div class="Home">Lost your Way? Continue Shopping: 
    <button id="err"><a href="./">AgroTech - Home ➤</a></button> </div>

</body>
<script>
    var $container = $('.bola');
    var renderer = new THREE.WebGLRenderer({ antialias: true });
    var camera = new THREE.PerspectiveCamera(80, 1, 0.1, 10000);
    var scene = new THREE.Scene();

    scene.add(camera);
    renderer.setSize(300, 300);
    $container.append(renderer.domElement);

    ///////////////////////////////////////////////

    // Camera
    camera.position.z = 200;

    // Material
    var pinkMat = new THREE.MeshPhongMaterial({
        color: new THREE.Color("rgb(255,35,213)"),
        emissive: new THREE.Color("rgb(0,0,0)"),
        specular: new THREE.Color("rgb(255,155,155)"),
        shininess: 100,
        shading: THREE.FlatShading,
        transparent: 1,
        opacity: 1
    });

    var L1 = new THREE.PointLight(0xffffff, 1);
    L1.position.z = 100;
    L1.position.y = 100;
    L1.position.x = 100;
    scene.add(L1);

    var L2 = new THREE.PointLight(0xffffff, 0.8);
    L2.position.z = 200;
    L2.position.y = 400;
    L2.position.x = -100;
    scene.add(L2);

    // IcoSphere -> THREE.IcosahedronGeometry(80, 1) 1-4
    var Ico = new THREE.Mesh(new THREE.IcosahedronGeometry(75, 1), pinkMat);
    Ico.rotation.z = 0.5;
    scene.add(Ico);

    function update() {
        Ico.rotation.x += 2 / 100;
        Ico.rotation.y += 2 / 100;
    }

    // Render
    function render() {
        requestAnimationFrame(render);
        renderer.render(scene, camera);
        update();
    }

    render();
</script>


</html>

<?php require('footer.php')?>