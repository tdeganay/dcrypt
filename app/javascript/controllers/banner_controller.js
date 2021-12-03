import { Controller } from "stimulus";
import { THREE } from 'scripts/three';

export default class extends Controller {
  connect() {
    console.log("Hello from your first Stimulus controller")

    this.SEPARATION = 100
    this.AMOUNTX = 100
    this.AMOUNTY = 70

    this.container = null
    this.camera = null
    this.scene = null
    this.renderer = null

    this.particles = null
    this.particle = null
    this.count = 0

    this.mouseX = 85
    this.mouseY = -342

    this.windowHalfX = window.innerWidth / 2
    this.windowHalfY = window.innerHeight / 2

    this.init();
    this.animate();

  }

  init() {

    this.container = document.createElement('div');
    this.container.style.position = "absolute";
    this.element.style.height = "720px";
    this.container.style.overflow = "hidden";
    this.element.insertBefore(this.container, this.element.childNodes[0]);

    this.camera = new THREE.PerspectiveCamera(120, window.innerWidth / window.innerHeight, 1, 10000);
    this.camera.position.z = 1000;

    this.scene = new THREE.Scene();

    this.particles = new Array();

    var PI2 = Math.PI * 2;
    var material = new THREE.ParticleCanvasMaterial({

      color: 0xe1e1e1,
      program: function (context) {

        context.beginPath();
        context.arc(0, 0, .6, 0, PI2, true);
        context.fill();

      }

    });

    var i = 0;

    for (var ix = 0; ix < this.AMOUNTX; ix++) {

      for (var iy = 0; iy < this.AMOUNTY; iy++) {

        this.particle = this.particles[i++] = new THREE.Particle(material);
        this.particle.position.x = ix * this.SEPARATION - ((this.AMOUNTX * this.SEPARATION) / 2);
        this.particle.position.z = iy * this.SEPARATION - ((this.AMOUNTY * this.SEPARATION) / 2);
        this.scene.add(this.particle);

      }

    }

    this.renderer = new THREE.CanvasRenderer();
    this.renderer.setSize(window.innerWidth, window.innerHeight);
    this.container.appendChild(this.renderer.domElement);

    document.addEventListener('mousemove', (event) => { this.onDocumentMouseMove(event) }, false);
    document.addEventListener('touchstart', (event) => { this.onDocumentTouchStart(event) }, false);
    document.addEventListener('touchmove', (event) => { this.onDocumentTouchMove(event) }, false);

    //

    window.addEventListener('resize', (event) => { this.onWindowResize(event) }, false);

  }

  onWindowResize() {

    this.windowHalfX = window.innerWidth / 2;
    this.windowHalfY = window.innerHeight / 2;

    this.camera.aspect = window.innerWidth / window.innerHeight;
    this.camera.updateProjectionMatrix();

    this.renderer.setSize(window.innerWidth, window.innerHeight);

  }

  //

  onDocumentMouseMove(event) {

    this.mouseX = event.clientX - this.windowHalfX;
    this.mouseY = event.clientY - this.windowHalfY;

  }

  onDocumentTouchStart(event) {

    if (event.touches.length === 1) {

      event.preventDefault();

      this.mouseX = event.touches[0].pageX - this.windowHalfX;
      this.mouseY = event.touches[0].pageY - this.windowHalfY;

    }

  }

  onDocumentTouchMove(event) {

    if (event.touches.length === 1) {

      event.preventDefault();

      this.mouseX = event.touches[0].pageX - this.windowHalfX;
      this.mouseY = event.touches[0].pageY - this.windowHalfY;

    }

  }

  //

  animate() {

    requestAnimationFrame( () => {
      this.animate()
    });

    this.render();


  }

  render() {

    this.camera.position.x += (this.mouseX - this.camera.position.x) * .05;
    this.camera.position.y += (-this.mouseY - this.camera.position.y) * .05;
    this.camera.lookAt(this.scene.position);

    var i = 0;

    for (var ix = 0; ix < this.AMOUNTX; ix++) {

      for (var iy = 0; iy < this.AMOUNTY; iy++) {

        this.particle = this.particles[i++];
        this.particle.position.y = (Math.sin((ix + this.count) * 0.3) * 50) + (Math.sin((iy + this.count) * 0.5) * 50);
        this.particle.scale.x = this.particle.scale.y = (Math.sin((ix + this.count) * 0.3) + 1) * 2 + (Math.sin((iy + this.count) * 0.5) + 1) * 2;

      }

    }

    this.renderer.render(this.scene, this.camera);

    this.count += 0.1;

  }
}
