<?= $this->extend('layouts/admin.php'); ?>

<?= $this->section('content'); ?>
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-lg-12">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-gradient-warning text-white border-0">
                    <h4 class="mb-0 text-white">
                        <i class="fa fa-edit me-2"></i><?= $judul ?>
                    </h4>
                    <small class="text-white-50">Edit data penyakit tanaman ubi jalar</small>
                </div>

                <div class="card-body p-4">
                    <!-- Error display -->
                    <?php if (session()->getFlashdata('errors')): ?>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="fa fa-exclamation-triangle me-2"></i>
                            <strong>Terjadi kesalahan:</strong>
                            <ul class="mb-0 mt-2">
                                <?php foreach (session()->getFlashdata('errors') as $error): ?>
                                    <li><?= $error ?></li>
                                <?php endforeach; ?>
                            </ul>
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    <?php endif; ?>

                    <?php if (session()->getFlashdata('error')): ?>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="fa fa-exclamation-circle me-2"></i>
                            <strong>Gagal!</strong> <?= session()->getFlashdata('error') ?>
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    <?php endif; ?>

                    <form method="POST" action="<?= url_to('penyakit.update', $penyakit['kode_penyakit']) ?>"
                        class="needs-validation" novalidate>
                        <?= csrf_field() ?>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label fw-bold" for="kode_penyakit">
                                        <i class="fa fa-code me-1"></i>Kode Penyakit
                                        <span class="text-danger">*</span>
                                    </label>
                                    <input type="text" class="form-control" id="kode_penyakit" name="kode_penyakit"
                                        placeholder="Contoh: P01"
                                        value="<?= old('kode_penyakit', $penyakit['kode_penyakit']) ?>" required>
                                    <div class="form-text">Format: P01, P02, dst.</div>
                                    <div class="invalid-feedback">Kode penyakit wajib diisi</div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label fw-bold" for="nama_penyakit">
                                        <i class="fa fa-stethoscope me-1"></i>Nama Penyakit
                                        <span class="text-danger">*</span>
                                    </label>
                                    <input type="text" class="form-control" id="nama_penyakit" name="nama_penyakit"
                                        placeholder="Masukkan nama penyakit"
                                        value="<?= old('nama_penyakit', $penyakit['nama_penyakit']) ?>" required>
                                    <div class="invalid-feedback">Nama penyakit minimal 3 karakter</div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="form-label fw-bold" for="det_penyakit">
                                        <i class="fa fa-file-text me-1"></i>Deskripsi Penyakit
                                        <span class="text-danger">*</span>
                                    </label>
                                    <textarea class="form-control" id="det_penyakit" name="det_penyakit" rows="4"
                                        placeholder="Masukkan deskripsi detail penyakit..."
                                        required><?= old('det_penyakit', $penyakit['det_penyakit']) ?></textarea>
                                    <div class="form-text">Minimal 10 karakter</div>
                                    <div class="invalid-feedback">Deskripsi penyakit minimal 10 karakter</div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="form-label fw-bold" for="srn_penyakit">
                                        <i class="fa fa-medkit me-1"></i>Sarana/Solusi Penyakit
                                        <span class="text-danger">*</span>
                                    </label>
                                    <textarea class="form-control" id="srn_penyakit" name="srn_penyakit" rows="4"
                                        placeholder="Masukkan sarana atau solusi untuk mengatasi penyakit..."
                                        required><?= old('srn_penyakit', $penyakit['srn_penyakit']) ?></textarea>
                                    <div class="form-text">Minimal 10 karakter</div>
                                    <div class="invalid-feedback">Sarana penyakit minimal 10 karakter</div>
                                </div>
                            </div>
                        </div>

                        <!-- Info card showing current data -->
                        <div class="alert alert-light border">
                            <h6 class="alert-heading">
                                <i class="fa fa-info-circle me-2"></i>Data Saat Ini:
                            </h6>
                            <div class="row">
                                <div class="col-md-6">
                                    <small class="text-muted">
                                        <strong>Kode:</strong> <?= $penyakit['kode_penyakit'] ?><br>
                                        <strong>Nama:</strong> <?= $penyakit['nama_penyakit'] ?>
                                    </small>
                                </div>
                                <div class="col-md-6">
                                    <small class="text-muted">
                                        <strong>Deskripsi:</strong>
                                        <?= substr($penyakit['det_penyakit'], 0, 50) ?>...<br>
                                        <strong>Sarana:</strong> <?= substr($penyakit['srn_penyakit'], 0, 50) ?>...
                                    </small>
                                </div>
                            </div>
                        </div>

                        <div class="alert alert-warning">
                            <i class="fa fa-exclamation-triangle me-2"></i>
                            <strong>Perhatian:</strong>
                            Pastikan semua perubahan data sudah benar sebelum menyimpan. Data ini akan mempengaruhi
                            sistem diagnosis penyakit tanaman ubi jalar.
                        </div>

                        <div class="d-flex gap-2 justify-content-end">
                            <a href="<?= url_to('penyakit.index') ?>" class="btn btn-outline-secondary">
                                <i class="fa fa-arrow-left me-1"></i>Kembali
                            </a>
                            <button type="reset" class="btn btn-outline-warning">
                                <i class="fa fa-undo me-1"></i>Reset
                            </button>
                            <button type="submit" class="btn btn-warning">
                                <i class="fa fa-save me-1"></i>Update Penyakit
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Bootstrap form validation
        const forms = document.querySelectorAll('.needs-validation');
        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            });
        });

        // Auto resize textarea
        const textareas = document.querySelectorAll('textarea');
        textareas.forEach(textarea => {
            textarea.addEventListener('input', function () {
                this.style.height = 'auto';
                this.style.height = this.scrollHeight + 'px';
            });
        });

        // Character counter for textareas
        const detPenyakit = document.getElementById('det_penyakit');
        const srnPenyakit = document.getElementById('srn_penyakit');

        function addCharCounter(element, minLength = 10) {
            const counter = document.createElement('small');
            counter.className = 'form-text text-end';
            element.parentNode.appendChild(counter);

            function updateCounter() {
                const length = element.value.length;
                counter.textContent = `${length} karakter (minimal ${minLength})`;
                counter.className = length >= minLength ? 'form-text text-end text-success' : 'form-text text-end text-warning';
            }

            element.addEventListener('input', updateCounter);
            updateCounter();
        }

        addCharCounter(detPenyakit, 10);
        addCharCounter(srnPenyakit, 10);
    });
</script>
<?= $this->endSection(); ?>