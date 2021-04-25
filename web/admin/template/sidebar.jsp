<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="../../index3.html" class="brand-link">
        <img src="${pageContext.request.contextPath}/admin/assets/img/logo.jpg" alt="JustBuy Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">JustBuy</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user (optional) -->
        

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                
                <li class="nav-item">
                    <a href="../widgets.html" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Dashboard
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/AdminUserController?view=show" class="nav-link">
                        <i class="nav-icon fas fa-users"></i>
                        <p>
                            User
                        </p>
                    </a>
                </li>
                
                <li class="nav-item">
                    <a href="" class="nav-link">
                        <i class="nav-icon fas fa-percent"></i>
                        <p>
                            Product
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="AdminProductController?view=show" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>List Product</p>
                            </a>
                            <a href="AdminProductController?view=create" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Create</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="../../index.html" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Today's Deal</p>
                            </a>
                        </li>
                    </ul>
                </li>
                
                <li class="nav-item">
                    <a href="AdminBillController?view=showAllBills" class="nav-link">
                        <i class="nav-icon fas fa-file-invoice-dollar"></i>
                        <p>
                            Bill
                        </p>
                    </a>
                </li>
                
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon far fa-calendar-minus"></i>
                        <p>
                            Category
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="../../index.html" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Create</p>
                            </a>
                        </li>
                    </ul>
                </li>
                
                <li class="nav-item">
                    <a href="../widgets.html" class="nav-link">
                        <i class="nav-icon fas fa-comment-dots"></i>
                        <p>
                            Feedback
                        </p>
                    </a>
                </li>
                
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>