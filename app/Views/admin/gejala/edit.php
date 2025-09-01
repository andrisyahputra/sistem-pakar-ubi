<?= $this->extend('layouts/admin.php'); ?>

<?= $this->section('content'); ?>
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-lg-12">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-gradient-primary text-white border-0">
                    <h4 class="mb-0 text-white">
                        <i class="fa fa-edit me-2"></i><?= $judul ?>
                    </h4>
                    <small class="text-white-50">Perbarui data gejala yang sudah ada</small>
                </div>

                <div class="card-body p-4">
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

                    <form method="POST" action="<?= url_to('gejala.update', $gejala['kode_gejala']) ?>"
                        class="needs-validation" novalidate>
                        <?= csrf_field() ?>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label fw-bold" for="kode_gejala">
                                        <i class="fa fa-code me-1"></i>Kode Gejala
                                        <span class="text-danger">*</span>
                                    </label>
                                    <input type="text" class="form-control" id="kode_gejala" name="kode_gejala"
                                        value="<?= old('kode_gejala', $gejala['kode_gejala']) ?>" required>
                                    <div class="form-text">Format: G01, G02, dst.</div>
                                    <div class="invalid-feedback">Kode gejala wajib diisi</div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label fw-bold" for="nama_gejala">
                                        <i class="fa fa-tag me-1"></i>Nama Gejala
                                        <span class="text-danger">*</span>
                                    </label>
                                    <input type="text" class="form-control" id="nama_gejala" name="nama_gejala"
                                        value="<?= old('nama_gejala', $gejala['nama_gejala']) ?>" required>
                                    <div class="invalid-feedback">Nama gejala minimal 5 karakter</div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="form-label fw-bold" for="penyakit_id">
                                        <i class="fa fa-tag me-1"></i>Pilih Penyakit Terkait
                                        <span class="text-danger">*</span>
                                    </label>
                                    <?php
                                    $options = ['' => '-- Pilih Penyakit --'];
                                    foreach ($penyakit as $p) {
                                        $options[$p['kode_penyakit']] = $p['kode_penyakit'] . ' - ' . $p['nama_penyakit'];
                                    }

                                    echo form_dropdown(
                                        'penyakit_id',
                                        $options,
                                        old('penyakit_id', $gejala['kode_penyakit']),
                                        'class="form-select" id="penyakit_id" required'
                                    );
                                    ?>
                                    <div class="invalid-feedback">Silakan pilih penyakit terkait</div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label class="form-label fw-bold" for="mb">
                                        <i class="fa fa-plus-square me-1 text-success"></i>MB
                                        <span class="text-danger">*</span>
                                    </label>
                                    <input type="number" class="form-control" id="mb" name="mb" step="0.01" min="0"
                                        max="1" value="<?= old('mb', $gejala['mb']) ?>" required>
                                    <div class="form-text">Nilai antara 0.00 - 1.00</div>
                                    <div class="invalid-feedback">MB harus antara 0 dan 1</div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label class="form-label fw-bold" for="md">
                                        <i class="fa fa-minus-square me-1 text-warning"></i>MD
                                        <span class="text-danger">*</span>
                                    </label>
                                    <input type="number" class="form-control" id="md" name="md" step="0.01" min="0"
                                        max="1" value="<?= old('md', $gejala['md']) ?>" required>
                                    <div class="form-text">Nilai antara 0.00 - 1.00</div>
                                    <div class="invalid-feedback">MD harus antara 0 dan 1</div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label class="form-label fw-bold">
                                        <i class="fa fa-calculator me-1 text-info"></i>CF
                                    </label>
                                    <input type="text" class="form-control bg-light" id="cf_display" readonly
                                        value="<?= number_format(old('mb', $gejala['mb']) - old('md', $gejala['md']), 2) ?>">
                                    <div class="form-text">CF = MB - MD (otomatis)</div>
                                </div>
                            </div>
                        </div>

                        <div class="alert alert-info">
                            <i class="fa fa-info-circle me-2"></i>
                            Certainty Factor dihitung otomatis dari MB - MD.
                        </div>

                        <div class="d-flex gap-2 justify-content-end">
                            <a href="<?= url_to('gejala.index') ?>" class="btn btn-outline-secondary">
                                <i class="fa fa-arrow-left me-1"></i>Kembali
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="fa fa-save me-1"></i>Update Gejala
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
        const mbInput = document.getElementById('mb');
        const mdInput = document.getElementById('md');
        const cfDisplay = document.getElementById('cf_display');

        function calculateCF() {
            const mb = parseFloat(mbInput.value) || 0;
            const md = parseFloat(mdInput.value) || 0;
            const cf = mb - md;
            cfDisplay.value = cf.toFixed(2);

            cfDisplay.className = 'form-control bg-light';
            if (cf > 0) cfDisplay.classList.add('text-success');
            else if (cf < 0) cfDisplay.classList.add('text-danger');
            else cfDisplay.classList.add('text-muted');
        }

        mbInput.addEventListener('input', calculateCF);
        mdInput.addEventListener('input', calculateCF);
        calculateCF();
    });
</script>
<?= $this->endSection(); ?>