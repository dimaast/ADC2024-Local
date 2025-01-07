// import * as THREE from "three";
// import Lenis from "lenis";

// console.log(THREE);
// console.log(Lenis);

// window.addEventListener('load', () => {
//     const lenis = new Lenis()

//     console.log('Lenis initialized:', lenis)

//     function raf(time) {
//       lenis.raf(time)
//       requestAnimationFrame(raf)
//     }
//     requestAnimationFrame(raf)

//     const images = []
//     let loadedImageCount = 0

//     function loadImages() {
//       for (let i = 1; i <= 7; i++) {
//         const img = new Image()
//         img.onload = function () {
//           images.push(img)
//           loadedImageCount++

//           if (loadedImageCount === 7) {
//             initializeScene()
//           }
//         }
//         img.onerror = function () {
//           loadedImageCount++
//           if (loadedImageCount === 7) {
//             initializeScene()
//           }
//         }
//         img.src = `/assets/img${i}.jpg`;
//       }
//     }

//     function initializeScene() {
//       const scene = new THREE.Scene()
//       const camera = new THREE.PerspectiveCamera(
//         45,
//         window.innerWidth / window.innerHeight,
//         0.1,
//         1000
//       )

//       const renderer = new THREE.WebGLRenderer({
//         canvas: document.querySelector('canvas'),
//         antialias: true,
//         powerPreference: 'high-performance'
//       })

//       renderer.setSize(window.innerWidth, window.innerHeight)
//       renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))
//       renderer.setClearColor(0x000000)

//       const parentWidth = 75
//       const parentHeight = 20
//       const curvature = 35
//       const segmentsX = 200
//       const segmentsY = 200

//       const parentGeometry = new THREE.PlaneGeometry(
//         parentWidth,
//         parentHeight,
//         segmentsX,
//         segmentsY
//       )

//       const positions = parentGeometry.attributes.position.array
//       for (let i = 0; i < positions.length; i += 3) {
//         const x = positions[i]
//         const distanceFromCenter = Math.abs(x / (parentWidth / 2))
//         positions[i + 2] = Math.pow(distanceFromCenter, 2) * curvature
//       }

//       parentGeometry.computeVertexNormals()

//       const totalSlides = 7
//       const slideWidth = 15
//       const gap = 0.5
//       const cycleWidth = totalSlides * (slideWidth + gap)

//       const textureCanvas = document.createElement('canvas')
//       const ctx = textureCanvas.getContext('2d', {
//         alpha: false,
//         willReadFrequently: false
//       })

//       textureCanvas.width = 8192
//       textureCanvas.height = 2048

//       const texture = new THREE.CanvasTexture(textureCanvas)
//       texture.wrapS = THREE.RepeatWrapping
//       texture.wrapT = THREE.RepeatWrapping
//       texture.minFilter = THREE.LinearFilter
//       texture.magFilter = THREE.LinearFilter
//       texture.anisotropy = Math.min(
//         4,
//         renderer.capabilities.getMaxAnisotropy()
//       )

//       const parentMaterial = new THREE.MeshBasicMaterial({
//         map: texture,
//         side: THREE.DoubleSide
//       })

//       const parentMesh = new THREE.Mesh(parentGeometry, parentMaterial)
//       parentMesh.position.set(0, 0, 0)
//       parentMesh.rotation.x = THREE.MathUtils.degToRad(-20)
//       parentMesh.rotation.y = THREE.MathUtils.degToRad(20)
//       scene.add(parentMesh)

//       const distance = 17.5
//       const heightOffset = 5
//       const offsetX = distance * Math.sin(THREE.MathUtils.degToRad(20))
//       const offsetZ = distance * Math.cos(THREE.MathUtils.degToRad(20))

//       camera.position.set(offsetX, heightOffset, offsetZ)
//       camera.lookAt(0, -2, 0)
//       camera.rotation.z = THREE.MathUtils.degToRad(-5)

//       // Параллакс эффект
//       let mouseX = 0
//       let mouseY = 0
//       const parallaxStrength = 0.1

//       window.addEventListener('mousemove', (event) => {
//         mouseX = (event.clientX / window.innerWidth) * 2 - 1
//         mouseY = -(event.clientY / window.innerHeight) * 2 + 1
//       })

//       function updateTexture(offset = 0) {
//         ctx.fillStyle = '#000'
//         ctx.fillRect(0, 0, textureCanvas.width, textureCanvas.height)

//         const fontSize = 180
//         // ctx.font = 500 ${fontSize}px Arial
//         ctx.textAlign = 'center'
//         ctx.textBaseline = 'middle'

//         const extraSlides = 2

//         for (let i = -extraSlides; i < totalSlides + extraSlides; i++) {
//           let slideX = -i * (slideWidth + gap)
//           slideX += offset * cycleWidth

//           const textureX = (slideX / cycleWidth) * textureCanvas.width
//           let wrappedX = textureX % textureCanvas.width
//           if (wrappedX < 0) wrappedX += textureCanvas.width

//           let slideIndex = ((-i % totalSlides) + totalSlides) % totalSlides
//           let slideNumber = slideIndex + 1

//           const slideRect = {
//             x: wrappedX,
//             y: textureCanvas.height * 0.05,
//             width: (slideWidth / cycleWidth) * textureCanvas.width,
//             height: textureCanvas.height * 0.9
//           }

//           const img = images[slideNumber - 1]
//           if (img) {
//             const imgAspect = img.width / img.height
//             const rectAspect = slideRect.width / slideRect.height

//             let drawWidth, drawHeight, drawX, drawY

//             if (imgAspect > rectAspect) {
//               drawWidth = slideRect.width
//               drawHeight = drawWidth / imgAspect
//               drawX = slideRect.x
//               drawY = slideRect.y + (slideRect.height - drawHeight) / 2
//             } else {
//               drawHeight = slideRect.height
//               drawWidth = drawHeight * imgAspect
//               drawX = slideRect.x + (slideRect.width - drawWidth) / 2
//               drawY = slideRect.y
//             }

//             ctx.save()
//             ctx.beginPath()
//             ctx.roundRect(
//               slideRect.x,
//               slideRect.y,
//               slideRect.width,
//               slideRect.height
//             )
//             ctx.clip()
//             ctx.drawImage(img, drawX, drawY, drawWidth, drawHeight)
//             ctx.restore()

//             ctx.fillStyle = 'white'
//           }
//         }
//         texture.needsUpdate = true
//       }

//       let currentScroll = 0

//       lenis.on(
//         'scroll',
//         ({ scroll, limit, velocity, direction, progress }) => {
//           console.log('Scroll event triggered:', {
//             scroll,
//             limit,
//             velocity,
//             direction,
//             progress
//           })
//           currentScroll = scroll / limit
//           updateTexture(-currentScroll)
//           renderer.render(scene, camera)
//         }
//       )

//       let resizeTimeout
//       window.addEventListener('resize', () => {
//         if (resizeTimeout) clearTimeout(resizeTimeout)
//         resizeTimeout = setTimeout(() => {
//           camera.aspect = window.innerWidth / window.innerHeight
//           camera.updateProjectionMatrix()
//           renderer.setSize(window.innerWidth, window.innerHeight)
//         }, 250)
//       })

//       function animate() {
//         // Добавление эффекта параллакса на позиции
//         parentMesh.position.x +=
//           (mouseX * parallaxStrength - parentMesh.position.x) * 0.1
//         parentMesh.position.y +=
//           (mouseY * parallaxStrength - parentMesh.position.y) * 0.1

//         renderer.render(scene, camera)
//         requestAnimationFrame(animate)
//       }

//       animate()
//       updateTexture(0)
//       renderer.render(scene, camera)
//     }

//     loadImages()
//   })