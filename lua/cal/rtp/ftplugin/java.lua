local jdtls = require('jdtls');
local mason_registry = require("mason-registry")

local home = os.getenv("HOME")
local java_bin = home .. '/.sdkman/candidates/java/' ..
    '21.0.8-amzn' ..
    '/bin/java'

MASON = vim.fn.stdpath("data") .. "/mason"

-- JDTLS_PATH = MASON .. "/packages/jdtls"
JDTLS_PATH = home .. "/Programs/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository"
-- JDTLS_PATH = home .. "/.vscode-server/extensions/redhat.java-1.41.1-linux-x64/server"

LAUNCHER = vim.fn.glob(JDTLS_PATH .. '/plugins/org.eclipse.equinox.launcher_*.jar')

-- LOMBOK = MASON .. "/packages/jdtls/lombok.jar"

-- JDTLS_PATH = home .. "/Programs/jdtls/jdt-language-server-1.9.0-202203031534"
-- LOMBOK = mason_registry.get_package("jdtls"):get_install_path() .. "/lombok.jar"
LOMBOK = MASON .. "/packages/jdtls/lombok.jar"

-- JAVA_DAP = vim.fn.glob(MASON ..
--     "/packages/java-debug-adapter" ..
--     "/extension/server/com.microsoft.java.debug.plugin-*.jar")

-- JAVA_DAP = vim.fn.glob(home ..
--     "/.vscode-server/extensions/vscjava.vscode-java-debug-0.58.2/server" ..
--     "/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")

JAVA_DAP = vim.fn.glob(home ..
    "/Programs/java-debug" ..
    "/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")

local bundles = { JAVA_DAP }
vim.list_extend(
    bundles,
    vim.split(
        vim.fn.glob(
            home ..
            "/Programs/vscode-java-test" ..
            "/server/*.jar",
            true),
        "\n")
)

-- vim.list_extend(
--     bundles,
--     vim.split(
--         vim.fn.glob(
--             MASON ..
--             "/packages/java-test" ..
--             "/extension/server/*.jar",
--             true),
--         "\n")
-- )

-- vim.list_extend(
--     bundles,
--     vim.split(
--         vim.fn.glob(
--             home ..
--             "/.vscode-server/extensions/vscjava.vscode-java-test-0.43.1" ..
--             "/server/*.jar",
--             true),
--         "\n")
-- )

LSP_KEYS = require('cal.keymaps.lsp')
EXT_ON_ATTACH = function(_, bufnr)
    LSP_KEYS(_, bufnr)
    vim.keymap.set('n', "gI", function()
        jdtls.super_implementation();
    end)
    vim.keymap.set('n', "<leader>co", function()
        jdtls.organize_imports()
    end)
    vim.keymap.set('n', "<leader>;d", function()
        vim.cmd [[JdtUpdateDebugConfig]]
    end)
    vim.keymap.set('n', "<leader>;h", function()
        vim.cmd [[JdtUpdateHotcode]]
    end)
    vim.keymap.set('n', "<leader>;R", function()
        vim.cmd [[JdtRestart]]
    end)
    vim.keymap.set('n', "<leader>;W", function()
        vim.cmd [[JdtWipeDataAndRestart]]
    end)
    vim.keymap.set('n', "<leader>;bf", function()
        vim.cmd [[JdtCompile full]]
    end)

    vim.keymap.set('n', "<leader>;t", function()
        jdtls.test_nearest_method()
    end)
    vim.keymap.set('n', "<leader>;T", function()
        jdtls.test_class()
    end)
    vim.keymap.set('n', "<leader>;c", function()
        jdtls.test_class()
    end)
end

local root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1])
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
-- local workspace_dir = os.getenv("HOME") .. '/.workspace/' .. project_name
local workspace_dir = vim.fn.getcwd() .. '/../.workspace/' .. project_name

local capabilities = {
    workspace = {
        configuration = true
    },
    textDocument = {
        completion = {
            completionItem = {
                snippetSupport = true
            }
        }
    }
}

vim.list_extend(capabilities, require('cmp_nvim_lsp').default_capabilities())
local extendedClientCapabilities = jdtls.extendedClientCapabilities;
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true;

local settings = {
    java = {
        signatureHelp = { enabled = true },
        completion = {
            favoriteStaticMembers = {
                "org.junit.jupiter.api.Assertions.*",
                "org.mockito.Mockito.*"
            }
        },
        templates = {
            fileHeader = {
                "/**",
                "* Globe FinTech Innovations, Inc.",
                "* Copyright (c) 2004-2024 All Rights Reserved.",
                "*/",
            },
            typeComment = {
                "$$type",
            }
        }
    }
}

local opts = {
    capabilities = capabilities,
    cmd = {
        java_bin,
        -- home .. '/.vscode-server/extensions/redhat.java-1.41.1-linux-x64/jre/21.0.6-linux-x86_64/bin/java',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '--add-opens', 'java.base/sun.nio.fs=ALL-UNNAMED',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '-javaagent:' .. LOMBOK,
        '-jar', LAUNCHER,
        '-configuration', JDTLS_PATH .. '/config_linux',
        '-data', workspace_dir
    },
    root_dir = root_dir,
    on_attach = EXT_ON_ATTACH,
    init_options = {
        bundles = bundles,
        extendedClientCapabilities = extendedClientCapabilities,
    },
    settings = settings
}

jdtls.start_or_attach(opts)
