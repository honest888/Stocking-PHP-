<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a class="brand-link" style="padding: 13px 20px; cursor: pointer;">
        <span class="brand-text font-weight-light"><?php echo $APP_TITLE; ?></span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item">
                    <a href="index.php" class="nav-link <?php echo ($page_name == 'Stocking Input') ? 'active' : ''; ?>">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Input</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="stocking_overview.php" class="nav-link <?php echo ($page_name == 'Stocking Overview') ? 'active' : ''; ?>">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Overview</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="stocking_levels.php" class="nav-link <?php echo ($page_name == 'Stocking Level') ? 'active' : ''; ?>">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Stocking Levels</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="stocking_admin.php" class="nav-link <?php echo ($page_name == 'Stocking Admin') ? 'active' : ''; ?>">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Admin</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="stocking_history.php" class="nav-link <?php echo ($page_name == 'Stocking History') ? 'active' : ''; ?>">
                        <i class="far fa-circle nav-icon"></i>
                        <p>History</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="admin_user_setting.php" class="nav-link <?php echo ($page_name == 'User Setting') ? 'active' : ''; ?>">
                        <i class="far fa-circle nav-icon"></i>
                        <p>User Setting</p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>