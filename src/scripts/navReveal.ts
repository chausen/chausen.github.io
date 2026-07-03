let lastScroll = 0;
const header = document.getElementById('site-header');

window.addEventListener('scroll', () => {
  if (!header) return;
  const currentScroll = window.scrollY;
  if (currentScroll > lastScroll && currentScroll > 80) {
    header.classList.add('-translate-y-full');
  } else {
    header.classList.remove('-translate-y-full');
  }
  lastScroll = currentScroll;
});
